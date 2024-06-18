import 'package:flutter/material.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Profile'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Text('P'),
      ),
    );
  }
}