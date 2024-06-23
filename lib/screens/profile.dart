
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
// import 'package:quick_bite/components/drawer/app_drawer.dart';
// import 'package:shimmer/shimmer.dart';
// import 'components/notification_provider.dart';
// import 'notification_provider.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//         title: const Text('Profile'),
//         centerTitle: true,
//       ),
//       drawer: const AppDrawer(),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return _buildShimmerEffect();
//           }
//           if (snapshot.hasError) {
//             return const Center(child: Text('Error loading profile data'));
//           }
//           if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
//             return const Center(child: Text('No profile data found'));
//           }

//           var userData = snapshot.data!.data() as Map<String, dynamic>?;

//           if (userData == null) {
//             return const Center(child: Text('No profile data found'));
//           }

//           return ListView(
//             padding: const EdgeInsets.all(16.0),
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.email),
//                 title: const Text('Email'),
//                 subtitle: Text(user.email ?? 'No email'),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.person),
//                 title: const Text('First Name'),
//                 subtitle: Text(userData['firstName'] ?? 'No first name'),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.edit),
//                 title: const Text('Edit Profile'),
//                 onTap: () {
//                   // Navigate to Edit Profile Screen
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.history),
//                 title: const Text('Order History'),
//                 onTap: () {
//                   // Navigate to Order History Screen
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.rate_review),
//                 title: const Text('Reviews'),
//                 onTap: () {
//                   // Navigate to Reviews Screen
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.share),
//                 title: const Text('Share App'),
//                 onTap: () {
//                   // Share App Logic
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.help),
//                 title: const Text('FAQ'),
//                 onTap: () {
//                   // Navigate to FAQ Screen
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.settings),
//                 title: const Text('Settings'),
//                 onTap: () {
//                   // Navigate to Settings Screen
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.update),
//                 title: const Text('Update App'),
//                 onTap: () {
//                   // Update App Logic
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.notifications),
//                 title: const Text('Notification'),
//                 trailing: Consumer<NotificationProvider>(
//                   builder: (context, notificationProvider, _) {
//                     return Switch(
//                       value: notificationProvider.isNotificationEnabled,
//                       onChanged: (value) {
//                         notificationProvider.setNotificationEnabled(value);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.delete),
//                 title: const Text('Delete Account'),
//                 onTap: () async {
//                   bool? confirm = await showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text('Delete Account'),
//                       content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.of(context).pop(false),
//                           child: const Text('Cancel'),
//                         ),
//                         TextButton(
//                           onPressed: () => Navigator.of(context).pop(true),
//                           child: const Text('Delete'),
//                         ),
//                       ],
//                     ),
//                   );
//                   if (confirm == true) {
//                     // Delete user account
//                     await user.delete();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Account deleted successfully')),
//                     );
//                     Navigator.pushReplacementNamed(context, '/signup');
//                   }
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildShimmerEffect() {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: [
//         Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: Column(
//             children: [
//               ListTile(
//                 leading: const CircleAvatar(backgroundColor: Colors.white),
//                 title: Container(height: 10.0, color: Colors.white),
//                 subtitle: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const CircleAvatar(backgroundColor: Colors.white),
//                 title: Container(height: 10.0, color: Colors.white),
//                 subtitle: Container(height: 10.0, color: Colors.white),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.edit, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.history, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.rate_review, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.share, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.help, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.settings, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.update, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.notifications, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.delete, color: Colors.grey),
//                 title: Container(height: 10.0, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../model/usermodel.dart';
import '../services/auth/auth_services.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 
  bool _notificationsEnabled = true;
  bool _isUploading = false;
  String? _profileImageUrl;
  String? _firstName;
  String? _lastName;
  String? _email;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

Future<void> _loadUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        _profileImageUrl = doc['profileImageUrl'];
        _firstName = doc['firstName'];
        _lastName = doc['lastName'];
        _email = user.email;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _isUploading = true;
      });
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          File file = File(pickedFile.path);
          String filePath = 'profile_images/${user.uid}.png';
          await FirebaseStorage.instance.ref(filePath).putFile(file);
          String downloadUrl = await FirebaseStorage.instance.ref(filePath).getDownloadURL();
          await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
            'profileImageUrl': downloadUrl,
          });
          setState(() {
            _profileImageUrl = downloadUrl;
            _isUploading = false;
          });
        }
      } catch (e) {
        setState(() {
          _isUploading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
    // Here you can add the logic to enable/disable notifications in your app
  }

  Future<void> _confirmDeleteAccount(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  User? user = FirebaseAuth.instance.currentUser;
                  await user?.delete();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Account deleted successfully')),
                  );
                  Navigator.pushReplacementNamed(context, '/');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<User?>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: const Text('Profile'),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: 
        user == null
          ? Center(child: CircularProgressIndicator()): 
        ListView(
           padding: EdgeInsets.all(16.0),
          children:[
             Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), 
                    color: Colors.white,),
                    
                    width: MediaQuery.of(context).size.width, 
                    height: 100, 
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children:[ CircleAvatar(
                                radius: 26,
                                backgroundImage: _profileImageUrl != null
                                    ? NetworkImage(_profileImageUrl!)
                                    : const AssetImage('assets/icons/user.png') as ImageProvider,
                              ),
                              Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: _pickImage,
                          ),
                        ),
                          if (_isUploading)
                          Positioned.fill(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                         ] ),
                            const SizedBox(width: 10,), 
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                        children: [
                             Text(
                          _firstName ?? '',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _lastName ?? '',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                       
                        ],
                      ), 
                       Text(
                          _email ?? '',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ), 
                      
                              ],
                            ))
                        ],
                      ),
                    ),
                  ),
       ] ), 
              
              
    ));
  }
}
