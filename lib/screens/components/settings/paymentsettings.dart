import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
        title: Text('Payment Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Manage Saved Delivery Addresses'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Manage Delivery Addresses screen
            },
          ),
          ListTile(
            title: Text('Set Default Delivery Address'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Set Default Delivery Address screen
            },
          ),
        ],
      ),
    );
  }
}
