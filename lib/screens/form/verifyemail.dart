import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _isEmailVerified = false;
  bool _isChecking = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _checkEmailVerified();
  }

  Future<void> _checkEmailVerified() async {
    _user = _auth.currentUser;
    await _user?.reload();
    setState(() {
      _isEmailVerified = _user?.emailVerified ?? false;
      _isChecking = false;
    });
    if (_isEmailVerified) {
      Navigator.pushReplacementNamed(context, '/congratulations');
    }
  }

  Future<void> _sendVerificationEmail() async {
    try {
      await _user?.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to send verification email.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: _isChecking
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: _isEmailVerified
                  ? const Text('Email verified. Redirecting...')
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('A verification email has been sent to ${_user?.email}. Please check your inbox.'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _sendVerificationEmail,
                          child: const Text('Resend Email'),
                        ),
                        ElevatedButton(
                          onPressed: _checkEmailVerified,
                          child: const Text('I have verified'),
                        ),
                      ],
                    ),
            ),
    );
  }
}
