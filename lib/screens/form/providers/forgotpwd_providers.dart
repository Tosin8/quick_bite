
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

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

  Future<void> sendPasswordResetEmail(BuildContext context) async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }

    setLoading(true);

    try {
      final email = emailController.text;

      await _auth.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password reset email sent. Please check your email.'),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to send password reset email: $e'),
        backgroundColor: Colors.red,
      ));
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}