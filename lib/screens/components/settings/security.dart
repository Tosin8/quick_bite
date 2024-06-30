import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    final doc = await FirebaseFirestore.instance.collection('settings').doc(user!.uid).get();

    if (doc.exists) {
      setState(() {
        _biometricAuth = doc['biometricAuth'];
        _twoFactorAuth = doc['twoFactorAuth'];
      });
    }
  }

  Future<void> _saveSettings() async {
    final user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('settings').doc(user!.uid).set({
      'biometricAuth': _biometricAuth,
      'twoFactorAuth': _twoFactorAuth,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
