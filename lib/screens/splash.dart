

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:quick_bite/screens/home.dart';

import 'form/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login'); // Navigate to login screen after 3 seconds
    });
  }
   // _checkLoginStatus();
     
    
  

  // Future<void> _checkLoginStatus() async {
  //   await Future.delayed(const Duration(seconds: 2)); // Simulate a splash screen delay
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if ( user == null) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) =>  LoginScreen()),
  //     );
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const HomeScreen()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}