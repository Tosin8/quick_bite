// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService{

//   // get instance of firebase auth
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   // get current user
//   User? getCurrentUser(){
//     return _firebaseAuth.currentUser; 
//   }

//   // sign in 
//   Future<UserCredential> signInWithEmailPassword(String email, password) async {

//     try {

//       UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return userCredential;
//     } on FirebaseAuthException catch (e) {  
//       throw Exception(e.code); 
//     }
//   }

//   // sign up
//   Future<UserCredential> signUpWithEmailPassword(String email, password) async {

//     try {

//       UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//       return userCredential;
//     } on FirebaseAuthException catch (e) {  
//       throw Exception(e.code); 
//     }
//   }

//   // sign out
//   Future<void> signOut() async {
//    return await _firebaseAuth.signOut();
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUp(String email, String password, String firstName, String lastName, String phoneNumber) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phoneNumber': phoneNumber,
        });
        await user.sendEmailVerification();
        return null;
      } else {
        return 'User is null';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}