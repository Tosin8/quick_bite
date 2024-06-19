
// // ignore_for_file: prefer_const_constructors, deprecated_member_use

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// class SignUpProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final phoneNumberController = TextEditingController();

//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   bool get isPasswordVisible => _isPasswordVisible;
//   bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

//    bool _isLoading = false;

//   bool get isLoading => _isLoading;

//   void setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   void togglePasswordVisibility() {
//     _isPasswordVisible = !_isPasswordVisible;
//     notifyListeners();
//   }

//   void toggleConfirmPasswordVisibility() {
//     _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//     notifyListeners();
//   }
  

//   String? emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter an email';
//     }
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }

//    String? firstNameValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your first name';
//     }
//     return null;
//   }

//   String? lastNameValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your last name';
//     }
//     return null;
//   }
// String? phoneNumberValidator(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter your phone number';
//   }
//   // Check if it contains exactly 11 digits
//   if (!RegExp(r'^\d{11}$').hasMatch(value)) {
//     return 'Phone number must be 11 digits';
//   }
//   return null;
// }
//   String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a password';
//     }
//     if (value.length < 10) {
//       return 'Password must be at least 10 characters';
//     }
//     return null;
//   }

//   String? confirmPasswordValidator(String? value) {
//     if (value != passwordController.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }

// Future<bool> isEmailAlreadyRegistered(String email) async {
//     try {
//       final result = await _auth.fetchSignInMethodsForEmail(email);
//       return result.isNotEmpty;
//     } catch (e) {
//       print('Error checking email: $e');
//       return false;
//     }
//   }

//   Future<void> signUp(BuildContext context) async {


//   //  final authService = AuthService();
//     if (formKey.currentState == null || !formKey.currentState!.validate()) {
//       return;
//     }
   
//    setLoading(true);
//    final email = emailController.text;

//     if (await isEmailAlreadyRegistered(email)) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email is already registered'), 
//       backgroundColor: Colors.red,));
//       return;
//     }
//     try {
//       final firstName = firstNameController.text;
//       final lastName = lastNameController.text;
//       final email = emailController.text;
//       final password = passwordController.text;
//       final phoneNumber = phoneNumberController.text;
//        _auth.setLanguageCode(Localizations.localeOf(context).languageCode);
//       // await authService.signUpWithEmailPassword(
//       //   emailController.text,
//       //    passwordController.text);
//        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password, 
//       );
//         // Save user details to Firestore
//     await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
//       'firstName': firstName,
//       'lastName': lastName,
//       'email': email,
//       'phoneNumber': phoneNumber,
//     });
      
//        // Send email verification
//       await userCredential.user!.sendEmailVerification();

//        // Show success message
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Sign up successful. Verification email sent.'),
//         backgroundColor: Colors.green,
//       ),
//     );

//       // Navigate to verify email screen
//       Navigator.pushReplacementNamed(context, '/verify_email');

  
//       // ignore: use_build_context_synchronously
//       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up successful'), 
//       // backgroundColor: Colors.green,)
//       // );
//       // Navigator.of(context).pushReplacement(
//       //   MaterialPageRoute(builder: (context) => HomeScreen()),
//       // );
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up failed: ${e.message}'), 
//       backgroundColor: Colors.red,));
//     }
//     finally {
//       setLoading(false);
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     firstNameController.dispose();
//     lastNameController.dispose();
//     phoneNumberController.dispose();
//     super.dispose();
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