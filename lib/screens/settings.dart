import 'package:flutter/material.dart';

import 'components/settings/notifications.dart';
import 'components/settings/paymentsettings.dart';
import 'components/settings/preference.dart';
import 'components/settings/privacysettings.dart';
import 'components/settings/security.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Notification Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Payment Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentSettingsScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Privacy Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacySettingsScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Preferences'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreferencesScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Security Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecuritySettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
