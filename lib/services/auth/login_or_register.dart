import 'package:flutter/material.dart';

import '../../screens/form/login.dart';
import '../../screens/form/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  // initially, show login page

  bool showLoginScreen = true; 

  // toogle between login and register page. 
  void tooglePages() {
    setState(() {
      showLoginScreen = !showLoginScreen; 
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(onTap: tooglePages); 
    } else {
      return RegisterScreen(onTap: tooglePages,); 
    }
  }
}