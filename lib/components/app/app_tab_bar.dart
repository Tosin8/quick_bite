// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final TabController tabController; 
  const AppTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: const [
          // 1st tab
          Tab(
            icon: Icon(Icons.home), 
          ), 
           // 2nd tab
          Tab(
            icon: Icon(Icons.home), 
          )

        ], ),
    );
  }
}
