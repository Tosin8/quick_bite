import 'package:flutter/material.dart';
import 'package:quick_bite/components/app/app_silver_app.dart';

import '../components/drawer/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   //automaticallyImplyLeading: false,
      //   title: const Text('Home'),
      //   backgroundColor: Colors.grey[300],
      //   centerTitle: true,
      // ),
      drawer: const AppDrawer(), 
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
const AppSilverApp(
  title: Text('Title'),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
Divider(
  indent: 25, endIndent: 25, color: Colors.black
), 
    ],
  ))
        ], 
        body: Container(color: Colors.blue,),)
    );
  }
}