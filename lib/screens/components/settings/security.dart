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
    // Load the settings from Firestore or SharedPreferences
    setState(() {});
  }

  Future<void> _saveSettings() async {
    // Save the settings to Firestore or SharedPreferences
  }

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
