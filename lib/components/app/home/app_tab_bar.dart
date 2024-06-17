// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quick_bite/model/food.dart';

class AppTabBar extends StatelessWidget {
  final TabController tabController; 
  const AppTabBar({
    super.key,
    required this.tabController,
  });


List<Tab> _buildCategoryTabs() {
  return FoodCategory.values.map((category) {
    return Tab(
      text: category.toString().split('.').last,
    );
  }).toList(); 
}
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        controller: tabController,
        // tabs: const [
        //   // 1st tab
        //   Tab(
        //     icon: Icon(Icons.home), 
        //   ), 
        //    // 2nd tab
        //   Tab(
        //     icon: Icon(Icons.home), 
        //   )

        // ], 
        tabs: _buildCategoryTabs(), 
        ),
    );
  }
}
