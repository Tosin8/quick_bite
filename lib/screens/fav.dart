import 'package:QuickBite/components/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Favorites'), 
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(child: Text('Fav Screen'))
    );
  }
}