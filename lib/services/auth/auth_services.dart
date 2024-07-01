

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/usermodel.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
   Stream<User?> get authStateChanges => _auth.authStateChanges();

  

  Future<UserCredential> signUp({
    required String email, 
    required String password, 
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String address,
    
    }) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
     if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'address': address,
        'profileImageUrl': '', 
      });
    }
    return userCredential;
  }




    Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }


 User? get currentUser => _auth.currentUser;

  Future<UserModel> getUserData() async {
    User? user = currentUser;
    if (user != null) {
      DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('User data not found');
      }
     
    } else {
      throw Exception('No user logged in');
    }
  }

   Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

 Future<void> confirmPasswordReset(String oobCode, String newPassword) async {
    await _auth.confirmPasswordReset(
      code: oobCode,
      newPassword: newPassword,
    );
  }
  Future<void> updatePassword(String newPassword) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.updatePassword(newPassword);
    } else {
      throw Exception('No user logged in');
    }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> deleteUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).delete();
      await user.delete();
    }
  }
}




Future<void> _loadSettings() async {
  final user = FirebaseAuth.instance.currentUser;
  final settingsRef = FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('settings').doc('appSettings');

  final snapshot = await settingsRef.get();
  if (snapshot.exists) {
    final data = snapshot.data()!;
    setState(() {
      // Load each setting from the data map
      _orderStatusUpdates = data['orderStatusUpdates'] ?? true;
      _promotionsOffers = data['promotionsOffers'] ?? true;
      _feedbackReviews = data['feedbackReviews'] ?? true;
      _darkMode = data['darkMode'] ?? false;
      _biometricAuth = data['biometricAuth'] ?? false;
      _twoFactorAuth = data['twoFactorAuth'] ?? false;
    });
  }
}

Future<void> _saveSettings() async {
  final user = FirebaseAuth.instance.currentUser;
  final settingsRef = FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('settings').doc('appSettings');

  await settingsRef.set({
    'orderStatusUpdates': _orderStatusUpdates,
    'promotionsOffers': _promotionsOffers,
    'feedbackReviews': _feedbackReviews,
    'darkMode': _darkMode,
    'biometricAuth': _biometricAuth,
    'twoFactorAuth': _twoFactorAuth,
  });
}
