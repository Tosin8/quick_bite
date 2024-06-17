// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:quick_bite/components/form/app_textfield.dart';

// import '../../components/form/app_button.dart';
// import 'login.dart';


// class ForgotpwdScreen extends StatefulWidget {
//   const ForgotpwdScreen({
//     super.key,
//     this.onTap,
//   });

// final void Function()? onTap; 

// void reset () {}
//   @override
//   State<ForgotpwdScreen> createState() => _ForgotpwdScreenState();
// }

// class _ForgotpwdScreenState extends State<ForgotpwdScreen> {

//   final TextEditingController emailController = TextEditingController();
  
 
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Theme.of(context).colorScheme.surface,
//       backgroundColor: Colors.grey[300],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Logo

//             // Icon(Icons.lock_open_rounded, 
//             // size: 72, 
//             // color: Theme.of(context).colorScheme.inverseSurface, 
//             // ), 
//             // ignore: sized_box_for_whitespace
//             Container(
//               width: 80, height: 80,
//               child: Image.asset('assets/icons/logo.png')),

//             const SizedBox(height: 20,), 
//             Text('Quick Bite', 
//             style: TextStyle(
//               fontSize: 16, 
//               color: Theme.of(context).colorScheme.inverseSurface, 
//             ),), 
//             const SizedBox(height: 4,), 
//             Text('Reset Your Password', 
//             style: TextStyle(
//               fontSize: 16, 
//               color: Theme.of(context).colorScheme.inverseSurface, 
//             ),), 

// const SizedBox(height: 25,), 
//             // email textfield
//             AppTextfield(
//               textInputAction: TextInputAction.next,
//               controller: emailController, 
//               hintText: 'Email', 
//               obscureText: false,
//             ), 
            
           

//             const SizedBox(height: 20,), 

//            // Sign In Button. 
//             const AppButton(
//               text: 'Reset Password', 
//              // onTap: reset, 
//               ), 

//               // Not a Member? Register Now. 
//               const SizedBox(height: 20,), 
//                 GestureDetector(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())); 
//                     }, 
//                     child: Text('Sign In', 
//                     style: TextStyle(
//                       //color: Theme.of(context).colorScheme.inversePrimary, 
//                       color: Colors.black.withOpacity(0.6),
//                       fontWeight: FontWeight.bold, 
//                       decoration: TextDecoration.underline
//                     ),),
//                   ), 
              
//           ],
//         )
//       ),
//     );
//   }
// }