import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/components/form/app_button.dart';

import '../../services/auth/auth_services.dart';
import 'providers/register_providers.dart'; // Replace with the actual import

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  bool _isLoading = false;
   bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String? error = await Provider.of<AuthService>(context, listen: false).signUp(
        _emailController.text,
        _passwordController.text,
        _firstNameController.text,
        _lastNameController.text,
        _phoneNumberController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (error == null) {
        // Navigate to verify email screen
        Navigator.pushNamed(context, '/verify_email');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up failed: $error')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
      
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Container(
                  width: 80, height: 80, child: Image.asset('assets/icons/logo.png'),
                ),
                const SizedBox(height: 20,), 
                Text('Quick Bite', style: TextStyle(fontSize: 16, 
                color: Theme.of(context).colorScheme.inverseSurface,  ),), 
                const SizedBox(height: 5,), 
                Text('Let\'s Create your Account', 
                style: TextStyle(
                  fontSize: 16, 
                  color: Theme.of(context).colorScheme.inverseSurface, 
                ),),  
            
            const SizedBox(height: 25,),
            // Email field. 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
          hintText: 'Email',
           hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                    //  labelText: 'Email'
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                      return null;
                    },
                  ),
                ),

                // Password. 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                     keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    controller: _passwordController,
                    decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
                     hintText: 'Password',
           hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),    
                      //labelText: 'Password'
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
                  ),
                      
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),

                // Confirm Password. 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
          hintText: 'Confirm Password',
           hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                      
                      //labelText: 'Confirm Password'
                      
                      ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),

                // First Name
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                     keyboardType: TextInputType.name,
 textInputAction: TextInputAction.next,
                    controller: _firstNameController,
                    decoration: InputDecoration(
                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
                  hintText: 'First Name',
           hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),      
                    //  labelText: 'First Name'
                      
                      ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),

                // Last Name. 
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
                  hintText: 'Last Name',
           hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),      
                      //labelText: 'Last Name'
                      
                      ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),


                // phone no
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                     keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
          hintText: 'Phone Number',
           hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                      
                      //labelText: 'Phone Number'
                      ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 11) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    // : ElevatedButton(
                    //     onPressed: () => _signUp(context),
                    //     child: Text('Sign Up'),
                    //   ),
                    : AppButton(text: 'Sign Up', onTap: () => _signUp(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}