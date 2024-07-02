import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';
import 'dart:io';

import 'package:quick_bite/themes/theme_provider.dart';
import 'package:shimmer/shimmer.dart';

import 'components/profile/edit_profile.dart';
import 'components/profile/faq.dart';
import 'settings.dart';
import 'splash.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  const ProfileScreen({super.key, required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void shareApp() async {
  await FlutterShare.share(
    title: 'Check out Quick Bite!',
    text: 'It’s the easiest way to order delicious food online. Download now: [Your App Store Link]',
    linkUrl: '[Your App Store Link]',
    chooserTitle: 'Share with'
  );
}

 
   bool _isUploading = false;
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    setState(() {
      _isUploading = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${user!.uid}.jpg');
      await storageRef.putFile(_imageFile!);
      final imageUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'profileImageUrl': imageUrl});
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

 Future<void> _deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).delete();
      await user.delete();
    } catch (e) {
      print('Error deleting account: $e');
    } finally {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
    Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userRef = FirebaseFirestore.instance.collection('users').doc(user?.uid);
   //final user = Provider.of<User?>(context);


   // if (user == null) {
      return  Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: user == null ? 
        const Center(child: Text('No user logged in'))
        : StreamBuilder<DocumentSnapshot>(
              stream: userRef.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                 if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('User data not available'));
                }
                 final userData = snapshot.data!.data() as Map<String, dynamic>;
                //    if (userData == null) {
                //   return const Center(child: Text('User data not available'));
                // }
                final profileImageUrl = userData['profileImageUrl'] ?? '';
                final firstName = userData['firstName'] ?? '';
                final lastName = userData['lastName'] ?? '';
                final email = userData['email'] ?? '';
                final address = userData['address'] ?? '';
                final phoneNumber = userData['phoneNumber'] ?? '';
                final notificationsEnabled = userData['notificationsEnabled'] ?? false;
                return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                 Stack(
                            children: [
                              _isUploading
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.grey[300],
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 40,
                                      backgroundImage: profileImageUrl.isNotEmpty
                                          ? NetworkImage(profileImageUrl)
                                          : const AssetImage('assets/icons/user.png')  as ImageProvider,
                                    ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: _pickImage,
                                  child: const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.blue,
                                    child: Icon(
                                      Icons.edit,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(userData['firstName'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            const SizedBox(width: 4,), 
                             Text(userData['lastName'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          ],
                        ), 
                        // Text('First Name: ${userData['firstName']}'),
                        // Text('Last Name: ${userData['lastName']}'),
                       // Text('Email: ${userData['email']}'),
                         Text(userData['email'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,),),
                        
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10,), 
                const Divider(color: Colors.white,thickness: 2,),
                 const SizedBox(height: 10,),  
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                  child: ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Edit Profile'),
                    onTap: () async {
                      // Navigate to Edit Profile screen
                    final result = await Navigator.push(context, 
                      MaterialPageRoute(builder: (context)  => EditProfile(userId: user.uid, userData: userData)));
                         if (result == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Profile updated successfully'),
                                ),
                              );
                              setState(() {
                                _loadUserData(); // Refresh the data
                              });
                            }
                    },
                  ),
                ),
                const SizedBox(height: 10,), 
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                  child: ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('Order History'),
                    onTap: () {
                      // Navigate to Order History screen
                    },
                  ),
                ),
                 const SizedBox(height: 10,), 
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                  child: ListTile(
                    leading: const Icon(Icons.rate_review),
                    title: const Text('Pending Reviews'),
                    onTap: () {
                      // Navigate to Reviews screen
                    },
                  ),
                ),
                 const SizedBox(height: 10,), 
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                    child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      // Navigate to Settings screen
                       Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SettingsScreen()));
                    },
                                    ),
                  ),
                  const SizedBox(height: 10,), 
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                    child: SwitchListTile(
                    title: const Text('Notifications'),
                    secondary: const Icon(Icons.notifications),
                    value: notificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                         userRef.update({'notificationsEnabled': value});
                      });
                      // Save preference to Firestore or SharedPreferences
                    },
                                    ),
                  ),
                  const SizedBox(height: 10,),
                   Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                     child: ListTile(
                                       leading: const Icon(Icons.question_answer),
                                       title: const Text('FAQ'),
                                       onTap: () {
                      // Navigate to FAQ screen
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FaqScreen()));
                                       },
                                     ),
                   ),
                   const SizedBox(height: 10,), 
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                  child: ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share App'),
                    onTap: () => 
                      // Share app logic
                      shareApp(), 
                    
                  ),
                ),
               const SizedBox(height: 10,), 
                 const Divider(color: Colors.white,thickness: 2,), 
            
                
                Center(
                  child: ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red,),
                    title: const Text('Delete Account', style: TextStyle(color: Colors.red),),
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
                      ) ?? false;
                  
                      if (confirm) {
                        await _deleteAccount();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
    }  ));
      
    
  }
}
