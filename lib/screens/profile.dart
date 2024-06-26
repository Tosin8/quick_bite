import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';
import 'dart:io';

import '../services/auth/auth_services.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = false;

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String userId = Provider.of<User?>(context, listen: false)!.uid;

      // Show loading indicator while the image is uploading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      try {
        Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');
        await storageRef.putFile(imageFile);
        String downloadUrl = await storageRef.getDownloadURL();

        // Update Firestore with the new profile image URL
        await FirebaseFirestore.instance.collection('users').doc(userId).update({
          'profileImageUrl': downloadUrl,
        });

        // Dismiss the loading indicator
        Navigator.of(context).pop();
      } catch (e) {
        // Dismiss the loading indicator
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to upload image')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('No user logged in')),
      );
    }

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: Text('Failed to load user data')),
          );
        }

        var userData = snapshot.data!.data() as Map<String, dynamic>;

        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(title: const Text('Profile'), backgroundColor: Colors.grey[300],),
          drawer: AppDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(context),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: userData['profileImageUrl'] != ''
                            ? NetworkImage(userData['profileImageUrl'])
                            : const AssetImage('assets/default_avatar.png') as ImageProvider,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name: ${userData['firstName']}'),
                        Text('Last Name: ${userData['lastName']}'),
                        Text('Email: ${userData['email']}'),
                      ],
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                  onTap: () {
                    // Navigate to Edit Profile screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text('Order History'),
                  onTap: () {
                    // Navigate to Order History screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.rate_review),
                  title: const Text('Reviews'),
                  onTap: () {
                    // Navigate to Reviews screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share App'),
                  onTap: () {
                    // Share app logic
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.question_answer),
                  title: const Text('FAQ'),
                  onTap: () {
                    // Navigate to FAQ screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Navigate to Settings screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.system_update),
                  title: const Text('Update App'),
                  onTap: () {
                    // Update app logic
                  },
                ),
                SwitchListTile(
                  title: const Text('Notifications'),
                  secondary: const Icon(Icons.notifications),
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                    // Save preference to Firestore or SharedPreferences
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Delete Account'),
                  onTap: () async {
                    bool confirm = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Account'),
                        content: const Text('Are you sure you want to delete your account?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );

                    if (confirm) {
                      await Provider.of<AuthService>(context, listen: false).deleteUser();
                      Navigator.pushReplacementNamed(context, '/signup');
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
