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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Notification Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Payment Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentSettingsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Privacy Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacySettingsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Preferences'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreferencesScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Security Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
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
