// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quick_bite/components/form/app_button.dart';
import 'package:quick_bite/components/form/app_textfield.dart';
import 'package:quick_bite/screens/form/forgotpwd.dart';
import 'package:quick_bite/services/auth/auth_services.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.onTap,
  });

final void Function()? onTap; 
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 

  // login method
  void login() async {
     
    // get instance of auth service. 
    final authService = AuthService(); 

    // try sign in 
    try {
      await authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }


// display any errors

catch(e) {
  // ignore: use_build_context_synchronously
  showDialog(context: context,
   builder: (context) => AlertDialog(
    title: Text(e.toString())
   ));
}
    // navigate to home page 
    // Navigator.push(context,
    //  MaterialPageRoute(
    //   builder: (context) => const HomeScreen())); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo

            // Icon(Icons.lock_open_rounded, 
            // size: 72, 
            // color: Theme.of(context).colorScheme.inverseSurface, 
            // ), 
            // ignore: sized_box_for_whitespace
            Container(
              width: 80, height: 80,
              child: Image.asset('assets/icons/logo.png')),

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
            // email textfield
            AppTextfield(
              validator: (value) {
                
              },
              textInputAction: TextInputAction.next,
              controller: emailController, 
              hintText: 'Email', 
              obscureText: false,
            ), 
            
            const SizedBox(height: 10,), 
              AppTextfield(
              controller: passwordController, 
              hintText: 'Password', 
              obscureText: true,
            
            ),

            const SizedBox(height: 20,), 

            // Sign In Button. 
            AppButton(
              text: 'Sign In', 
              onTap: login, 
              ), 

              // Not a Member? Register Now. 
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
                    onTap: widget.onTap, 
                    child: Text('Register here', 
                    style: TextStyle(
                      //color: Theme.of(context).colorScheme.inversePrimary, 
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold, 
                    ),),
                  )
                ],
              ), 
          
          const SizedBox(height: 10,), 
          TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotpwdScreen())),
           child: const Text('Forgot Password', 
           
           style: TextStyle(color: Colors.black, 
           decoration: TextDecoration.underline),
           ))
          ],
        )
      ),
    );
  }
}