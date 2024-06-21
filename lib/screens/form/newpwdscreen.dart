import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_bite/components/form/app_button.dart';

import 'pwd_reset_congrats.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;

  NewPasswordScreen({super.key, required this.email});

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
   bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;


  Future<void> _resetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        await user?.updatePassword(_passwordController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasswordResetSuccessScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
      SizedBox(height: 100,), 
                    // logo
                    Container(
                      width: 80, height: 80, child: Image.asset('assets/icons/logo.png'),
                    ),
                    const SizedBox(height: 20,), 
                    Text('Quick Bite', style: TextStyle(fontSize: 16, 
                    color: Theme.of(context).colorScheme.inverseSurface,  ),), 
                    const SizedBox(height: 5,), 
                    Text('Type in your New Password', 
                    style: TextStyle(
                      fontSize: 16, 
                      color: Theme.of(context).colorScheme.inverseSurface, 
                    ),),  
                
                const SizedBox(height: 15,),
                  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                 
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next, 
                      controller: _passwordController,
                      decoration: InputDecoration(
                         suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                         errorBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                             enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
                ), 
                        hintText: 'New Password',
                        labelText: 'New Password'),
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your new password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
              
                  // Confirm Password. 
              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                      
                      textInputAction: TextInputAction.done, 
                      keyboardType: TextInputType.visiblePassword,
                      controller: _confirmPasswordController,
                      decoration:  InputDecoration
                      
                      (
                            suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
                ), 
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password'),
                      
                      obscureText: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // _isLoading ? 
                  // const CircularProgressIndicator(): 
                  // AppButton(text: 'Reset Password', 
                  // onTap: () => _resetPassword), 
                  ElevatedButton(
                onPressed: _resetPassword,
                child: Text('Reset Password'),
              ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
