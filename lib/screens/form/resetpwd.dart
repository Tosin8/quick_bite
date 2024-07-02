import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/components/form/app_button.dart';
import 'package:quick_bite/screens/form/login.dart';

import 'newpwdscreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _logoUrl; 

  // Future<void> _resetPassword() async {
  //   if (!_formKey.currentState!.validate()) {
  //     return;
  //   }
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
  //     Navigator.pushReplacementNamed(context, '/reset-congratulations');
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to reset password. Please try again.')));
  //   }

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }
// Future<void> _resetPassword() async {

//     if (_formKey.currentState!.validate()) {
//                     String email = _emailController.text;
//                     await Provider.of<AuthService>(context, listen: false)
//                         .sendPasswordResetEmail(email);
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => NewPasswordScreen(email: email, oobCode: '',),
//                     //   ),
//                     // );

//                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text('Password reset link sent to $email'),
//                     ));
//                   }
// }

 @override
  void initState() {
    super.initState();
  _loadLogo();
  }

void _navigateToNewPasswordScreen() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPasswordScreen(email: _emailController.text)),
      );
    }
  }

Future<void> _loadLogo() async {
    try {
      final ref = FirebaseStorage.instance.ref().child('assets/logo.png');
      final url = await ref.getDownloadURL();
      setState(() {
        _logoUrl = url;
      });
    } catch (e) {
      print('Failed to load logo: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[300],
      body: Center(
     
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // logo
              //  Container(
              //   width: 80, height: 80,
              //   child: Image.asset('assets/icons/logo.png')),

                if (_logoUrl != null)
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.network(_logoUrl!),
                    ),
          
              const SizedBox(height: 20,), 
              Text('Quick Bite', 
              style: TextStyle(
                fontSize: 16, 
                color: Theme.of(context).colorScheme.inverseSurface, 
              ),), 
              const SizedBox(height: 4,), 
              Text('Reset Your Password', 
              style: TextStyle(
                fontSize: 16, 
                color: Theme.of(context).colorScheme.inverseSurface, 
              ),), 
          
          const SizedBox(height: 25,), 

           
              // Email address. 
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  
                  textInputAction: TextInputAction.done,
                  controller: _emailController,
                  decoration:  InputDecoration(
                    
                     enabledBorder:  const OutlineInputBorder(
            //borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), 
            borderSide: BorderSide(color:  Colors.black), 
          ), 
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
                    hintText: 'Email',
                    labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
                const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                   : AppButton(text: 'Reset Password', 
                   onTap: _navigateToNewPasswordScreen,), 
                   
                   //ElevatedButton(
                  //     onPressed: _resetPassword,
                  //     child: const Text('Reset Password'),
                  //   ),

                   TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }, 
              child: Text('Back to Login')), 
           
            ],
          ),
        ),
      ),
    );
  }
}
