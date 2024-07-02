// class UserModel {
//   final String email;
//   final String firstName;
//   final String lastName;

//   UserModel({required this.email, required this.firstName, required this.lastName});

//   factory UserModel.fromMap(Map<String, dynamic> data) {
//     return UserModel(
//       email: data['email'] ?? '',
//       firstName: data['firstName'] ?? '',
//       lastName: data['lastName'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'email': email,
//       'firstName': firstName,
//       'lastName': lastName,
//     };
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  String address;

  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.address,
  });

  // Factory method to create a UserModel from Firestore data
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      address: data['address'] ?? '',
    );
  }

  // Factory method to create a UserModel from a Map
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      address: data['address'] ?? '',
    );
  }

  // Convert UserModel to Map for storing in Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
    };
  }
}

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  // Fetch user data from Firestore
  Future<void> fetchUser(String uid) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        _user = UserModel.fromFirestore(doc);
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Update user address in Firestore
  Future<void> updateUserAddress(String uid, String newAddress) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'address': newAddress,
      });
      _user?.address = newAddress;
      notifyListeners();
    } catch (e) {
      print('Error updating user address: $e');
    }
  }
}
