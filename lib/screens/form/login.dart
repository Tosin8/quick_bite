// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quick_bite/components/form/app_textfield.dart';
import 'package:quick_bite/screens/form/signup.dart';

import '../../services/auth/auth_services.dart';
import 'forgotpwd.dart';
import 'providers/login_providers.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
   /// this.onTap,
  });

//final void Function()? onTap; 
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  

 
final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isPasswordVisible = false;

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String? error = await Provider.of<AuthService>(context, listen: false).login(
        _emailController.text,
        _passwordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (error == null) {
        // Navigate to home screen
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $error')));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Form(
      key: _formKey,
            //key: _formKey,
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
              const SizedBox(height: 4,), 
              Text('Welcome Back', 
              style: TextStyle(
                fontSize: 16, 
                color: Theme.of(context).colorScheme.inverseSurface, 
              ),), 
          
          const SizedBox(height: 25,), 
              // email textfield
              AppTextfield(
                validator: loginProvider.emailValidator,
                textInputAction: TextInputAction.next,
               // controller: emailController, 
                controller: loginProvider.emailController, 
                hintText: 'Email', 
                obscureText: false, 
              
              ), 
              
              const SizedBox(height: 10,), 
                AppTextfield(
                //controller: passwordController, 
                hintText: 'Password', 
                obscureText:  !loginProvider.isPasswordVisible,
               
              controller: loginProvider.passwordController, 
              validator: loginProvider.passwordValidator,
              suffixIcon: IconButton(
                    icon: Icon(
                      loginProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ), 
                     onPressed: loginProvider.togglePasswordVisibility,
                )),
          
               SizedBox(height: 20,), 
          
        
           
            // login button

            loginButton(loginProvider: loginProvider), 
          
                // Not a Member? Register Now. 
                const SizedBox(height: 20,), 
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?' , 
                    style: TextStyle(
                      //color: Theme.of(context).colorScheme.inversePrimary
                      color: Colors.black.withOpacity(0.6), 
                    ),
                    ), 
                    const SizedBox(width: 4,), 
                    GestureDetector(
                    //  onTap: widget.onTap, 
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                      child: Text('Register here', 
                      style: TextStyle(
                        //color: Theme.of(context).colorScheme.inversePrimary, 
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold, 
                      ),
                      ),
                    ), 
                  ],
                ), 
            
            const SizedBox(height: 10,), 
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotpwdScreen())),
             child: const Text('Forgot Password', 
             
             style: TextStyle(color: Colors.black, 
             decoration: TextDecoration.underline),
             ))
            ],
          ),
        )
      ),
    );
  }
}

class loginButton extends StatelessWidget {
  const loginButton({
    super.key,
    required this.loginProvider,
  });

  final LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: loginProvider.isLoading ? null : () => loginProvider.login(context), 
          child: Container(
            padding: const EdgeInsets.all(25), 
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white, 
              //color: Theme.of(context).colorScheme.secondary, 
            borderRadius: BorderRadius.circular(8)), 
            child: Center(
              child: loginProvider.isLoading ? Center(
    child: Row(
      children: [
        Container(
          height: 30, width: 30, 
          child: const CircularProgressIndicator()),
        const SizedBox(width: 10,), 
        Text('Please wait...', 
        style: TextStyle(
          //color: Theme.of(context).colorScheme.inversePrimary
          color: Colors.black.withOpacity(0.6), 
        ),
        ),
      ],
    ),
              ) : const Text('Login', 
              
              style: TextStyle(fontWeight: FontWeight.bold, 
              fontSize: 14,
            //  color: Theme.of(context).colorScheme.inversePrimary),
            color: Colors.black, 
            ), 
            ),
          )
         ) );
  }
}