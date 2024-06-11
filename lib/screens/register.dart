// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quick_bite/components/form/app_button.dart';
import 'package:quick_bite/components/form/app_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    this.onTap,
  });

final void Function()? onTap; 
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 
  final TextEditingController confirmPasswordController = TextEditingController(); 

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

            Icon(Icons.lock_open_rounded, 
            size: 72, 
            color: Theme.of(context).colorScheme.inverseSurface, 
            ), 

            const SizedBox(height: 20,), 
            Text('Quick Bite', 
            style: TextStyle(
              fontSize: 16, 
              color: Theme.of(context).colorScheme.inverseSurface, 
            ),),
             const SizedBox(height: 5,), 
            Text('Let\'s Create your Account', 
            style: TextStyle(
              fontSize: 16, 
              color: Theme.of(context).colorScheme.inverseSurface, 
            ),),  

const SizedBox(height: 25,), 
            // email textfield
            AppTextfield(
              textInputAction: TextInputAction.next,
              controller: emailController, 
              hintText: 'Email', 
              obscureText: false,
            ), 
            
            const SizedBox(height: 10,), 
              AppTextfield(
                textInputAction: TextInputAction.next,
              controller: passwordController, 
              hintText: 'Password', 
              obscureText: true,
            
            ),

             const SizedBox(height: 10,), 
              AppTextfield(
                textInputAction: TextInputAction.done,
              controller: confirmPasswordController, 
              hintText: 'Confirm Password', 
              obscureText: true,
            
            ),

            const SizedBox(height: 20,), 

            // Sign Up Button. 
            AppButton(
              text: 'Sign Up', 
              onTap: () {
                
              },
              ), 

              // A;ready have an account , login here. . 
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
                    onTap: widget.onTap, 
                    child: Text('Login here', 
                    style: TextStyle(
                      //color: Theme.of(context).colorScheme.inversePrimary, 
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold, 
                    ),),
                  )
                ],
              ), 
          ],
        )
      ),
    );
  }
}