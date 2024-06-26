

import 'dart:async';

import 'package:flutter/material.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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