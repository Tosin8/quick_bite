import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';
import 'package:quick_bite/themes/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Settings'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25, top: 10, right:25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // dark mode
                const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold),), 
                
                // Switch 
                CupertinoSwitch(
                  //value: true, 
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
                  onChanged: (value) => 
                  Provider.of<ThemeProvider>(context, 
                  listen: false).toggleTheme(),
                  ), 
              ],
            ),
          )
        ],
      )
    );
  }
}