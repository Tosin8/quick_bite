import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _orderStatusUpdates = true;
  bool _promotionsOffers = true;
  bool _feedbackReviews = true;

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
        _orderStatusUpdates = doc['orderStatusUpdates'];
        _promotionsOffers = doc['promotionsOffers'];
        _feedbackReviews = doc['feedbackReviews'];
      });
    }
  }

  Future<void> _saveSettings() async {
    final user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('settings').doc(user!.uid).set({
      'orderStatusUpdates': _orderStatusUpdates,
      'promotionsOffers': _promotionsOffers,
      'feedbackReviews': _feedbackReviews,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
        title: Text('Notification Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
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
      ),
    );
  }
}
