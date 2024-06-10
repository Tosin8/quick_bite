import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            // Logo

            Icon(Icons.lock_open_rounded, 
            size: 72, 
            color: Theme.of(context).colorScheme.inversePrimary, 
            ), 
          ],
        )
      ),
    );
  }
}