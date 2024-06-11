import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Settings'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
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
                Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold),), 
                
                // Switch 
                CupertinoSwitch(value: true, onChanged: (value){})
              ],
            ),
          )
        ],
      )
    );
  }
}