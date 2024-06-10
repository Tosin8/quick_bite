import 'package:flutter/material.dart';
import 'package:quick_bite/components/form/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 
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

const SizedBox(height: 25,), 
            // email textfield
            AppTextfield(
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

            SizedBox(height: 20,), 

            // Sign In Button. 
          ],
        )
      ),
    );
  }
}