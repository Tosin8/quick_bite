import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Container(
                  width: 80, 
                  height: 80,
                  child: Image.asset('assets/icons/logo.png')),
                  const SizedBox(height: 6,), 
                  Text('Quick Bite', style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontSize: 16),)
              ],
            ),
          ), 

          const SizedBox(height: 10,),
          Divider(color: Theme.of(context).colorScheme.secondary, thickness: 1.5,),
        ],
      ),
    );
  }
}