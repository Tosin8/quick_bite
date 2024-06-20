import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationScreen extends StatefulWidget {
  @override
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to send verification email.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verification'),
      ),
      body: _isChecking
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: _isEmailVerified
                  ? Text('Email verified. Redirecting...')
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('A verification email has been sent to ${_user?.email}. Please check your inbox.'),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _sendVerificationEmail,
                          child: Text('Resend Email'),
                        ),
                        ElevatedButton(
                          onPressed: _checkEmailVerified,
                          child: Text('I have verified'),
                        ),
                      ],
                    ),
            ),
    );
  }
}
