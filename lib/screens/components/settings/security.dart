import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SecuritySettingsScreen extends StatefulWidget {
  @override
  _SecuritySettingsScreenState createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool _biometricAuth = false;
  bool _twoFactorAuth = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }



Future<void> _loadSettings() async {
  final user = FirebaseAuth.instance.currentUser;
  final settingsRef = FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('settings').doc('appSettings');

  final snapshot = await settingsRef.get();
  if (snapshot.exists) {
    final data = snapshot.data()!;
    setState(() {
      // Load each setting from the data map
      // _orderStatusUpdates = data['orderStatusUpdates'] ?? true;
      // _promotionsOffers = data['promotionsOffers'] ?? true;
      // _feedbackReviews = data['feedbackReviews'] ?? true;
      // _darkMode = data['darkMode'] ?? false;
      _biometricAuth = data['biometricAuth'] ?? false;
      _twoFactorAuth = data['twoFactorAuth'] ?? false;
    });
  }
}

Future<void> _saveSettings() async {
  final user = FirebaseAuth.instance.currentUser;
  final settingsRef = FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('settings').doc('appSettings');

  await settingsRef.set({
    // 'orderStatusUpdates': _orderStatusUpdates,
    // 'promotionsOffers': _promotionsOffers,
    // 'feedbackReviews': _feedbackReviews,
    // 'darkMode': _darkMode,
    'biometricAuth': _biometricAuth,
    'twoFactorAuth': _twoFactorAuth,
  });
}

  // Future<void> _loadSettings() async {
  //   // Load the settings from Firestore or SharedPreferences
  //   setState(() {});
  // }

  // Future<void> _saveSettings() async {
  //   // Save the settings to Firestore or SharedPreferences
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Enable Biometric Authentication'),
            value: _biometricAuth,
            onChanged: (bool value) {
              setState(() {
                _biometricAuth = value;
              });
              _saveSettings();
            },
          ),
          ListTile(
            title: Text('Set up Two-Factor Authentication'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Two-Factor Authentication setup screen
            },
          ),
        ],
      ),
    );
  }
}
