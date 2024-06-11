import 'package:flutter/material.dart';

import '../components/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: AppDrawer(), 
    );
  }
}