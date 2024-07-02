import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/components/form/app_button.dart';
import 'package:quick_bite/screens/form/login.dart';

import '../../services/auth/auth_services.dart';
// Replace with the actual import

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
   final _addressController = TextEditingController();

  bool _isLoading = false;
   bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _logoUrl;

   @override
  void initState() {
    super.initState();
  _loadLogo();
  }

Future<void> _loadLogo() async {
    try {
      final ref = FirebaseStorage.instance.ref().child('assets/logo.png');
      final url = await ref.getDownloadURL();
      setState(() {
        _logoUrl = url;
      });
    } catch (e) {
      print('Failed to load logo: $e');
    }
  }
  

 void _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final _authService = Provider.of<AuthService>(context, listen: false);

        UserCredential userCredential = await _authService.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phoneNumber: _phoneNumberController.text.trim(),
          address: _addressController.text.trim(),
        );

        // Navigate to verify email screen
        Navigator.pushReplacementNamed(context, '/verify_email');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        // appBar: AppBar(
        //   title: const Text('Sign Up'),
        // ),
        body: Center(
        
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const SizedBox(height:50), 
                  // logo
                  // Container(
                  //   width: 80, height: 80, child: Image.asset('assets/icons/logo.png'),
                  // ),

                   if (_logoUrl != null)
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.network(_logoUrl!),
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
              
              const SizedBox(height: 15,),
              // Email field. 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      decoration: InputDecoration(
                           errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
            hintText: 'Email',
          
             hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                       labelText: 'Email'
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
      
       // First Name
                  Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                       keyboardType: TextInputType.name,
       textInputAction: TextInputAction.next,
                      controller: _firstNameController,
                      decoration: InputDecoration(
                           errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                               enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
                    hintText: 'First Name',
                    labelText: 'First Name', 
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
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                        keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                           errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
                    hintText: 'Last Name',
                    labelText: 'Last Name', 
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
      
                  // Password. 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                       keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: _passwordController,
                      decoration: InputDecoration(
                           errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                         enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
                       hintText: 'Password',
                         labelText: 'Password', 
             hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),    
                       
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
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                           errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
            hintText: 'Confirm Password',
              labelText: 'Confirm Password', 
              
             hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
              
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
                    ),
                        //labelText: 'Confirm Password'
                        
                        
                      obscureText: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value == null || value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
      
                 
      
                  // phone no
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                       keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
            hintText: 'Phone Number',
            labelText: 'Phone Number', 
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

                   // user address
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                    child: TextFormField(
                       keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: _addressController,
                      decoration: InputDecoration(
                        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
            hintText: 'Address',
            labelText: 'Address', 
             hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                        
                        //labelText: 'Phone Number'
                        ),
                   validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  _isLoading
                      ? const CircularProgressIndicator()
                      // : ElevatedButton(
                      //     onPressed: () => _signUp(context),
                      //     child: Text('Sign Up'),
                      //   ),
                      : AppButton(text: 'Sign Up', onTap: () => _signUp(context)),
                      const SizedBox(height: 20,), 
                      Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?' , 
                    style: TextStyle(
                      //color: Theme.of(context).colorScheme.inversePrimary
                      color: Colors.black.withOpacity(0.6), 
                    ),
                    ), 
                    const SizedBox(width: 4,), 
                    GestureDetector(
                    //  onTap: widget.onTap, 
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                      child: Text('Login', 
                      style: TextStyle(
                        //color: Theme.of(context).colorScheme.inversePrimary, 
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold, 
                      ),
                      ),
                    ), 
                  ],
                ), 
const SizedBox(height: 20,), 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}