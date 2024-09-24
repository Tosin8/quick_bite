import 'package:QuickBite/screens/fav.dart';
import 'package:QuickBite/screens/inbox.dart';
import 'package:QuickBite/screens/order.dart';
import 'package:QuickBite/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../screens/form/login.dart';
import '../../screens/home.dart';
import 'app_drawer_tile.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});




  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

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
            text: 'Orders',
             icon: Icons.shopping_bag,
              //onTap: () => Navigator.pop(context)
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) =>  OrderScreen()));
              },
              ),
               AppDrawerTile(
            text: 'Inbox',
             icon: Icons.message, 
              //onTap: () => Navigator.pop(context)
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const InboxScreen()));
              },
              ),
            //   AppDrawerTile(
            // text: 'Settings',
            //  icon: Icons.settings,
            //   onTap: (){
            //     Navigator.push(context, 
            //     MaterialPageRoute(builder: (context) => const SettingsScreen()));
            //   }),
              AppDrawerTile(
            text: 'Favorites',
             icon: Icons.favorite,
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const FavScreen()));
              }),
              AppDrawerTile(
            text: 'Profile',
             icon: Icons.person,
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const ProfileScreen(userId: '',)));
              }),


              const Spacer(), 
              AppDrawerTile(
            text: 'Logout',
             icon: Icons.logout,
              //onTap: logout, 
            // onTap: () => _logout(context),
              onTap: 
                () async {
              await FirebaseAuth.instance.signOut();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logout successful'),
                ),
              );
              Navigator.pushReplacementNamed(context, '/login');
            
              },
              ), 
              const SizedBox(height: 10,), 
        ],
      ),
    );
  }
}