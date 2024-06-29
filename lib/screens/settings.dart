

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _orderStatusUpdates = true;
  bool _promotionsOffers = true;
  bool _feedbackReviews = true;
  bool _biometricAuth = false;
  bool _twoFactorAuth = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        _darkMode = userDoc['darkMode'] ?? false;
        _orderStatusUpdates = userDoc['orderStatusUpdates'] ?? true;
        _promotionsOffers = userDoc['promotionsOffers'] ?? true;
        _feedbackReviews = userDoc['feedbackReviews'] ?? true;
        _biometricAuth = userDoc['biometricAuth'] ?? false;
        _twoFactorAuth = userDoc['twoFactorAuth'] ?? false;
      });
    }
  }

  Future<void> _saveSettings() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'darkMode': _darkMode,
        'orderStatusUpdates': _orderStatusUpdates,
        'promotionsOffers': _promotionsOffers,
        'feedbackReviews': _feedbackReviews,
        'biometricAuth': _biometricAuth,
        'twoFactorAuth': _twoFactorAuth,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationSettings(),
          Divider(),
          _buildPaymentSettings(),
          Divider(),
          _buildPrivacySettings(),
          Divider(),
          _buildAppPreferences(),
          Divider(),
          _buildSecuritySettings(),
        ],
      ),
    );
  }

  Widget _buildNotificationSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SwitchListTile(
          title: Text('Order Status Updates'),
          value: _orderStatusUpdates,
          onChanged: (bool value) {
            setState(() {
              _orderStatusUpdates = value;
            });
            _saveSettings();
          },
        ),
        SwitchListTile(
          title: Text('Promotions and Offers'),
          value: _promotionsOffers,
          onChanged: (bool value) {
            setState(() {
              _promotionsOffers = value;
            });
            _saveSettings();
          },
        ),
        SwitchListTile(
          title: Text('Feedback and Reviews'),
          value: _feedbackReviews,
          onChanged: (bool value) {
            setState(() {
              _feedbackReviews = value;
            });
            _saveSettings();
          },
        ),
      ],
    );
  }

  Widget _buildPaymentSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text('Manage Saved Delivery Addresses'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageDeliveryAddressesScreen()),
            );
          },
        ),
        ListTile(
          title: Text('Set Default Delivery Address'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SetDefaultDeliveryAddressScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPrivacySettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Privacy Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text('Manage Data Sharing Preferences'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageDataSharingScreen()),
            );
          },
        ),
        ListTile(
          title: Text('Opt-in/out of Marketing Communications'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MarketingCommunicationsScreen()),
            );
          },
        ),
        ListTile(
          title: Text('View Privacy Policy'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAppPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Preferences',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SwitchListTile(
          title: Text('Dark Mode'),
          value: _darkMode,
          onChanged: (bool value) {
            setState(() {
              _darkMode = value;
            });
            _saveSettings();
          },
        ),
      ],
    );
  }

  Widget _buildSecuritySettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Security Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TwoFactorAuthScreen()),
            );
          },
        ),
      ],
    );
  }
}
