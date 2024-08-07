// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  //final Function()? onTap; 
  final VoidCallback? onTap;
  final String text; 
  const AppButton(  {
    super.key,
    this.onTap,
    required this.text, 
    //required String label, 
    
    //required void Function() onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        padding: const EdgeInsets.all(25), 
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white, 
          //color: Theme.of(context).colorScheme.secondary, 
        borderRadius: BorderRadius.circular(8)), 
        child: Center(
          child: Text(text, 
          
          style: const TextStyle(fontWeight: FontWeight.bold, 
          fontSize: 14,
        //  color: Theme.of(context).colorScheme.inversePrimary),
        color: Colors.black, 
        ), 
        ),
      )
     ) );
  }
}
