
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'An email has been sent to your email address.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, 
              color: Colors.black, 
              fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Refresh the user to update email verification status
                Navigator.pushReplacementNamed(context, '/congrats');
              },
              child: const Text('I have verified my email'),
            ),
          ],
        ),
      ),
    );
  }
}