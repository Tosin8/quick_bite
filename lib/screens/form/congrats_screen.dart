import 'package:flutter/material.dart';
import 'dart:async';

class CongratulatoryScreen extends StatefulWidget {
  const CongratulatoryScreen({super.key});

  @override
  _CongratulatoryScreenState createState() => _CongratulatoryScreenState();
}

class _CongratulatoryScreenState extends State<CongratulatoryScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Your email has been verified successfully.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
