
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../services/auth/login_or_register.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  
  @override
  void initState() {
    super.initState();
    _navigateToForm();
  }

   _navigateToForm() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginOrRegister()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300], 
        width: MediaQuery.of(context).size.width, 
        height: MediaQuery.of(context).size.height, 
        child: Lottie.asset('assets/animation/splash_screen.json'),
      ),
    );
  }
}