
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';
import 'package:shimmer/shimmer.dart';
import 'components/notification_provider.dart';
import 'notification_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Profile'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerEffect();
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading profile data'));
          }
          if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
            return const Center(child: Text('No profile data found'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>?;

          if (userData == null) {
            return const Center(child: Text('No profile data found'));
          }

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text(user.email ?? 'No email'),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('First Name'),
                subtitle: Text(userData['firstName'] ?? 'No first name'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Profile'),
                onTap: () {
                  // Navigate to Edit Profile Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Order History'),
                onTap: () {
                  // Navigate to Order History Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.rate_review),
                title: const Text('Reviews'),
                onTap: () {
                  // Navigate to Reviews Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share App'),
                onTap: () {
                  // Share App Logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('FAQ'),
                onTap: () {
                  // Navigate to FAQ Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Navigate to Settings Screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.update),
                title: const Text('Update App'),
                onTap: () {
                  // Update App Logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notification'),
                trailing: Consumer<NotificationProvider>(
                  builder: (context, notificationProvider, _) {
                    return Switch(
                      value: notificationProvider.isNotificationEnabled,
                      onChanged: (value) {
                        notificationProvider.setNotificationEnabled(value);
                      },
                    );
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Account'),
                onTap: () async {
                  bool? confirm = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Account'),
                      content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    // Delete user account
                    await user.delete();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account deleted successfully')),
                    );
                    Navigator.pushReplacementNamed(context, '/signup');
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.white),
                title: Container(height: 10.0, color: Colors.white),
                subtitle: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.white),
                title: Container(height: 10.0, color: Colors.white),
                subtitle: Container(height: 10.0, color: Colors.white),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.rate_review, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.help, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.update, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.grey),
                title: Container(height: 10.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}