import 'package:flutter/material.dart';
import 'package:quick_bite/components/app/app_current_location.dart';
import 'package:quick_bite/components/app/app_description_box.dart';
import 'package:quick_bite/components/app/app_silver_app.dart';
import 'package:quick_bite/components/app/app_tab_bar.dart';

import '../components/drawer/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  // tab controller 
  late TabController _tabController; 

  @override
  void initState() {
   
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
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
  title: AppTabBar(tabController: null,), 
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
Divider(
  indent: 15, endIndent: 20, color: Colors.white
), 

/// current location
AppCurrentLocation(), 

// description box
AppDescriptionBox(), 
    ],
  ))
        ], 
        body: Container(color: Colors.blue,),)
    );
  }
}