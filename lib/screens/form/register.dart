// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quick_bite/components/form/app_button.dart';
import 'package:quick_bite/components/form/app_textfield.dart';
import 'package:quick_bite/screens/form/login.dart';
import 'package:quick_bite/services/auth/auth_services.dart';

import 'providers/register_providers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    this.onTap,
  });

final void Function()? onTap; 
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 
  final TextEditingController confirmPasswordController = TextEditingController(); 


// register method
// void register() async {

//   // get auth service. 
//   final authService = AuthService(); 

//   // check if passwords match -> create user. 

//   if (passwordController.text == confirmPasswordController.text) {

//     // create user.
//     try{
//    await  authService.signUpWithEmailPassword(emailController.text, passwordController.text);
//   }

//   // display any errors
//   catch (e) {
//     // ignore: use_build_context_synchronously
//     showDialog(context: context, 
//     builder: (context) => AlertDialog(title: Text(e.toString())));
//   }
//   }

//   // if passwords doesn't match -> show error.
//   else {
//     showDialog(context: context,
//      builder: (context) => const AlertDialog(title: Text('Passwords don\'t match')));
//   }
// }
  @override
  Widget build(BuildContext context) {
     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final signUpProvider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Form(
         // key: _formKey,
          key: signUpProvider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
          
              // Icon(Icons.lock_open_rounded, 
              // size: 72, 
              // color: Theme.of(context).colorScheme.inverseSurface, 
              // ), 
                // ignore: sized_box_for_whitespace
                Container(
                width: 80, height: 80,
                child: Image.asset('assets/icons/logo.png')),
          
              const SizedBox(height: 20,), 
              Text('Quick Bite', 
              style: TextStyle(
                fontSize: 16, 
                color: Theme.of(context).colorScheme.inverseSurface, 
              ),),
               const SizedBox(height: 5,), 
              Text('Let\'s Create your Account', 
              style: TextStyle(
                fontSize: 16, 
                color: Theme.of(context).colorScheme.inverseSurface, 
              ),),  
          
          const SizedBox(height: 25,), 
              // email textfield
              AppTextfield(
                textInputAction: TextInputAction.next,
                //controller: emailController, 
               controller:  signUpProvider.emailController, 
                hintText: 'Email', 
                obscureText: false,
                validator: signUpProvider.emailValidator
              ), 
              
              const SizedBox(height: 10,), 
                AppTextfield(
                  textInputAction: TextInputAction.next,
                controller: passwordController, 
                hintText: 'Password', 
                obscureText: true,
             validator: signUpProvider.passwordValidator,
              
              ),
          
               const SizedBox(height: 10,), 
                AppTextfield(
                  textInputAction: TextInputAction.done,
                controller: confirmPasswordController, 
                hintText: 'Confirm Password', 
                obscureText: true,
                 validator: signUpProvider.confirmPasswordValidator,
              
              ),
          
              const SizedBox(height: 20,), 
          
              // Sign Up Button. 
              // AppButton(
              //   text: 'Sign Up', 
              //  // onTap: register, 
              //  onTap: () => signUpProvider.signUp(context), 
              //   ), 
           ElevatedButton(
                  onPressed: () => signUpProvider.signUp(context),
                  child: Text('Sign Up'),
                ),
                // A;ready have an account , login here. . 
                const SizedBox(height: 20,), 
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?' , 
                    style: TextStyle(
                      //color: Theme.of(context).colorScheme.inversePrimary
                      color: Colors.black.withOpacity(0.6), 
                    ),
                    ), 
                    const SizedBox(width: 4,), 
                    // GestureDetector(
                    //   //onTap: widget.onTap, 
                    //   onTap: () => const LoginScreen(), 
                    //   child: Text('Login here', 
                    //   style: TextStyle(
                    //     //color: Theme.of(context).colorScheme.inversePrimary, 
                    //     color: Colors.black.withOpacity(0.6),
                    //     fontWeight: FontWeight.bold, 
                    //   ),),
                    // )
                    TextButton(onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen())), child: Text('Login here', 
                    style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),))
                  ],
                ), 
            ],
          ),
        )
      ),
    );
  }
}