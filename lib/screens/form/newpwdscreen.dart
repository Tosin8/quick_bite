import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../services/auth/auth_services.dart';
import 'pwd_reset_congrats.dart';

class NewPasswordScreen extends StatefulWidget {
  final String oobCode;

  NewPasswordScreen({required this.oobCode,
  
   });

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                        //   try {
                        //     await FirebaseAuth.instance
                        //         .confirmPasswordReset(
                        //           code: widget.oobCode,
                        //           newPassword: _passwordController.text,
                        //         );
                        //     Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => PasswordResetSuccessScreen(),
                        //       ),
                        //     );
                        //   } catch (e) {
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text('Error: ${e.toString()}'),
                        //     ));
                        //   } finally {
                        //     setState(() {
                        //       _isLoading = false;
                        //     });
                        //   }
                        // }

                        try {
                            await Provider.of<AuthService>(context, listen: false)
                                .confirmPasswordReset(
                                  widget.oobCode,
                                  _passwordController.text,
                                );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordResetSuccessScreen(),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Error: ${e.toString()}'),
                            ));
                          } finally {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      child: Text('Update Password'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
