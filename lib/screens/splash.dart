
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../auth/login_or_register.dart';




class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> with SingleTickerProviderStateMixin{
  
  @override
  void initState() {
    super.initState();
    _navigateToForm();
  }

   _navigateToForm() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginOrRegister()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/animation.json'),
      ),
    );
  }
}