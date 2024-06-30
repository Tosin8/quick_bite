import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Manage Data Sharing Preferences'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Manage Data Sharing Preferences screen
            },
          ),
          ListTile(
            title: Text('Opt-in/out of Marketing Communications'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Opt-in/out of Marketing Communications screen
            },
          ),
          ListTile(
            title: Text('View Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Policy screen
            },
          ),
        ],
      ),
    );
  }
}
