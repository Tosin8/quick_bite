import 'package:flutter/material.dart';
import 'dart:async';

class PasswordResetCongratulatoryScreen extends StatefulWidget {
  const PasswordResetCongratulatoryScreen({super.key});

  @override
  _PasswordResetCongratulatoryScreenState createState() => _PasswordResetCongratulatoryScreenState();
}

class _PasswordResetCongratulatoryScreenState extends State<PasswordResetCongratulatoryScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Password Reset Successfully!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'You can now log in with your new password.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
