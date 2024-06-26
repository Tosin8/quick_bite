import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';
import 'dart:io';

import 'package:quick_bite/services/auth/auth_services.dart';
import 'package:quick_bite/themes/theme_provider.dart';
import 'package:shimmer/shimmer.dart';

import 'splash.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // bool _notificationsEnabled = false;

  // Future<void> _pickImage(BuildContext context) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     File imageFile = File(pickedFile.path);
  //     String userId = Provider.of<User?>(context, listen: false)!.uid;

  //     // Show loading indicator while the image is uploading
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => const Center(child: CircularProgressIndicator()),
  //     );

  //     try {
  //       Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');
  //       await storageRef.putFile(imageFile);
  //       String downloadUrl = await storageRef.getDownloadURL();

  //       // Update Firestore with the new profile image URL
  //       await FirebaseFirestore.instance.collection('users').doc(userId).update({
  //         'profileImageUrl': downloadUrl,
  //       });

  //       // Dismiss the loading indicator
  //       Navigator.of(context).pop();
  //     } catch (e) {
  //       // Dismiss the loading indicator
  //       Navigator.of(context).pop();
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to upload image')));
  //     }
  //   }
  //}

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
        MaterialPageRoute(builder: (context) => SplashScreen()),
        (Route<dynamic> route) => false,
      );
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
                   if (userData == null) {
                  return Center(child: Text('User data not available'));
                }
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
                                          : const AssetImage('assets/default_avatar.png'),
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
                    onTap: () {
                      // Navigate to Edit Profile screen
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
                                       },
                                     ),
                   ),
                   const SizedBox(height: 10,), 
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),),
                  child: ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share App'),
                    onTap: () {
                      // Share app logic
                    },
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
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () { Navigator.of(context).pop(true);
                               _deleteAccount();
                              },
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
                ),
              ],
            ),
          );
    }  ));
      
    
  }
}
