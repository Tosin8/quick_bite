// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppSilverApp extends StatelessWidget {
  final Widget child; 
  final Widget title; 
  const AppSilverApp({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[300], 
      title: title, 
      flexibleSpace: FlexibleSpaceBar(
        background: title,
      ),
    );
  }
}
