import 'package:QuickBite/components/form/app_button.dart';
import 'package:QuickBite/screens/form/resetpwd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth/auth_services.dart';
import 'signup.dart';
// Replace with the actual import

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
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

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final _authService = Provider.of<AuthService>(context, listen: false);

      
        UserCredential userCredential =  await _authService.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Navigate to home screen
        Navigator.pushReplacementNamed(context, '/home');
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
       
        body: Center(
       
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Container(
                    // width: 80, height: 80, 
                    // child: Image.asset('assets/icons/logo.png'),
                //  ), 
                  if (_logoUrl != null)
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.network(_logoUrl!),
                    ),
                   const SizedBox(height: 20,), 
                  Text('Quick Bite', 
                  style: TextStyle(
                    fontSize: 16, 
                    color: Theme.of(context).colorScheme.inverseSurface, 
                  ),), 
                  const SizedBox(height: 4,), 
                  Text('Welcome Back', 
                  style: TextStyle(
                    fontSize: 16, 
                    color: Theme.of(context).colorScheme.inverseSurface, 
                  ),), 
              
              const SizedBox(height: 25,), 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      decoration: InputDecoration(
                        errorBorder: const OutlineInputBorder(
                //borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), 
                borderSide: BorderSide(color:  Colors.red), 
              ), 
                        enabledBorder: const OutlineInputBorder(
                //borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), 
                borderSide: BorderSide(color:  Colors.black), 
              ), 
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
              ), 
              hintText: 'Email', 
              labelText: 'Email',
                     
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),  
                       // labelText: 'Email'
                        
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
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      controller: _passwordController,
                      decoration: InputDecoration(
                         enabledBorder: const OutlineInputBorder(
              //borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), 
              borderSide: BorderSide(color:  Colors.black), 
            ), 
             errorBorder: const OutlineInputBorder(
                //borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), 
                borderSide: BorderSide(color:  Colors.red), 
              ), 
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
            ), 
            hintText: 'Password',
                       labelText: 'Password',
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
            
                   const SizedBox(height: 10,), 
            
                   // button. 
                    _isLoading
                      ? const CircularProgressIndicator()
                      : AppButton(text: 'Login', 
                      onTap: () => _login(context),
                      ), 
                      // : ElevatedButton(
                      //     onPressed: () => _login(context),
                      //     child: Text('Login'),
                      //   ),
                        const SizedBox(height: 20,), 
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?' , 
                      style: TextStyle(
                        //color: Theme.of(context).colorScheme.inversePrimary
                        color: Colors.black.withOpacity(0.6), 
                      ),
                      ), 
                      const SizedBox(width: 4,), 
                      GestureDetector(
                      //  onTap: widget.onTap, 
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen())),
                        child: Text('Register here', 
                        style: TextStyle(
                          //color: Theme.of(context).colorScheme.inversePrimary, 
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold, 
                        ),
                        ),
                      ), 
                 
                ],
              ),
              const SizedBox(height: 10,), 
              TextButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const ResetPasswordScreen())),
               child: const Text('Reset Password')), 
                     ] ),
                    ),
          ),
      ),
    ));
  }
}
