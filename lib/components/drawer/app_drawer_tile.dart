// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppDrawerTile extends StatelessWidget {
  final String text; 
  final IconData? icon; 
  final void Function()? onTap;
  const AppDrawerTile({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, left: 15),
      child: ListTile( 
        title: Text(text, 
        style: const TextStyle(color: Colors.black),), 
        leading: Icon(icon, 
        color: Colors.black), 
        onTap: onTap,
      ),
    );
  }
}
