// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController controller; 
  final String hintText; 
  final bool obscureText; 
  final Widget? suffixIcon;  
  final TextInputAction? textInputAction;
  
  final FormFieldValidator<String> validator; 
  
  const AppTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
     this.suffixIcon,
    this.textInputAction,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 25.0), 
      child: TextField(
        textInputAction: textInputAction,
        controller: controller, 
         
        obscureText: obscureText, 
       // validator: validator,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            //borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), 
            borderSide: BorderSide(color:  Colors.black), 
          ), 
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
          ), 
          hintText: hintText, 
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
        ),
      ),
    );
  }
}
