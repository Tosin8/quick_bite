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
      expandedHeight: 320,
      collapsedHeight: 100, 
      floating: true,
      pinned: true,
      actions: [
        // Cart Button
        IconButton(
          icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          
        },)
      ],
      backgroundColor: Colors.grey[300], 
      title: const Text('Quick Bite'),
      centerTitle: true, 
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true, 
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
