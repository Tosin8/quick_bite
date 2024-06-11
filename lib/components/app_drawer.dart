import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Container(
            width: 80, 
            height: 80,
            child: Image.asset('assets/icons/logo.png'))
        ],
      ),
    );
  }
}