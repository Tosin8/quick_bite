// to check if the current user is logged in or not. 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/screens/home.dart';
import 'package:quick_bite/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        // user is logged in . 

        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // user is not logged in.
        else {
          return const LoginOrRegister();
        }
        })
    );
  }
}