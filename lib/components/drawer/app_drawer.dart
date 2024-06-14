import 'package:flutter/material.dart';
import 'package:quick_bite/components/drawer/app_drawer_tile.dart';

import '../../screens/home.dart';
import '../../screens/settings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                // ignore: sized_box_for_whitespace
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
          const SizedBox(height: 10,), 
          AppDrawerTile(
            text: 'Home',
             icon: Icons.home,
              //onTap: () => Navigator.pop(context)
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              ),
              AppDrawerTile(
            text: 'Settings',
             icon: Icons.settings,
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const SettingsScreen()));
              }),
              const Spacer(), 
              AppDrawerTile(
            text: 'Logout',
             icon: Icons.logout,
              onTap: () {}, 
              ), 
              const SizedBox(height: 10,), 
        ],
      ),
    );
  }
}