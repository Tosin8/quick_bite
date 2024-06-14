import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/components/app/app_current_location.dart';
import 'package:quick_bite/components/app/app_description_box.dart';
import 'package:quick_bite/components/app/app_silver_app.dart';
import 'package:quick_bite/components/app/app_tab_bar.dart';
import 'package:quick_bite/model/food.dart';
import 'package:quick_bite/model/restaurant.dart';

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
   // _tabController = TabController(length: 2, vsync: this);
   _tabController = TabController(length: FoodCategory.values.length, vsync: this); 
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category. 
  List<Food> _filterMenuByCategory(FoodCategory category, 
  List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category. 
  
List<Widget> getFoodInThisCategory(List<Food> fullMenu){
  return FoodCategory.values.map((category) {
    List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu); 

    return ListView.builder(
      itemCount: categoryMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categoryMenu[index].name),
        ); 
      }, 
      ); 
  }).toList(); 
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
 AppSilverApp(
  title: AppTabBar(tabController: _tabController), 
  child: const Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
Divider(
  indent: 15,
   endIndent: 20, 
  color: Colors.white
), 

/// current location
AppCurrentLocation(), 

// description box
AppDescriptionBox(), 
    ],
  ))
        ], 
        // body: TabBarView(
        //   controller : _tabController, 
        //   children: const [
        //     Text('Hello'), 
        //     Text('hello 2'), 
        //     Text('hello 2'), 
        //     Text('hello 2'), 
        //     Text('hello 2'), 
        //   ]), 

        body: 
        Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController, 
            children: getFoodInThisCategory(restaurant.menu),
          ), 
          
          ), 
        )
    );
  }
}