
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_bite/screens/home.dart';


class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    bool _isLoading = false;
    bool _isPasswordVisible = false;
     bool get isLoading => _isLoading;
     bool get isPasswordVisible => _isPasswordVisible;

     void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
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
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }
   // final authService = AuthService();
     _isLoading = true;
    notifyListeners();

    try {
      // await _auth.signInWithEmailAndPassword(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
await _auth.signInWithEmailAndPassword(
  email: emailController.text, 
  password:passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        

        content: Text('Login successful')));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}