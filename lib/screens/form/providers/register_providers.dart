
// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_bite/screens/home.dart';


class SignUpProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }
  

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 10) {
      return 'Password must be at least 10 characters';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

Future<bool> isEmailAlreadyRegistered(String email) async {
    try {
      final result = await _auth.fetchSignInMethodsForEmail(email);
      return result.isNotEmpty;
    } catch (e) {
      print('Error checking email: $e');
      return false;
    }
  }

  Future<void> signUp(BuildContext context) async {


  //  final authService = AuthService();
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }
   
   final email = emailController.text;

    if (await isEmailAlreadyRegistered(email)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email is already registered'), 
      backgroundColor: Colors.red,));
      return;
    }
    try {
       _auth.setLanguageCode(Localizations.localeOf(context).languageCode);
      // await authService.signUpWithEmailPassword(
      //   emailController.text,
      //    passwordController.text);
       await _auth.createUserWithEmailAndPassword(
        email: email,
        password: passwordController.text,
      );
      
      
  
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up successful'), 
      backgroundColor: Colors.green,)
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up failed: $e'), 
      backgroundColor: Colors.red,));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}