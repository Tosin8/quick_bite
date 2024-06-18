
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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

void setLoading(bool loading) {
    _isLoading = loading;
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
    //  _isLoading = true;
    // notifyListeners();

    setLoading(true);

    try {
     
        final email = emailController.text;
        final password = passwordController.text;
      
 UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  email: email,  
  password:password, 
  
  );
  await sendSignInEmail(email);

  
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        

        content: Text('Login successful')));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: ${e.message}'), 
      backgroundColor: Colors.red,));
    } finally {
      // _isLoading = false;
      // notifyListeners();

      setLoading(false);
    }
  }

// Future<void> sendSignInEmail(String email) async {
//     HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendSignInEmail');
//     final results = await callable.call(<String, dynamic>{
//       'email': email,
//     });
//     if (!results.data['success']) {
//       print('Failed to send sign-in email: ${results.data['error']}');
//     }
//   }

  Future<void> sendSignInEmail(String email) async {
    try {
      HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendSignInEmail');
      await callable.call(<String, dynamic>{
        'email': email,
      });
    } catch (e) {
      print('Error sending sign-in email: $e');
    }
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}