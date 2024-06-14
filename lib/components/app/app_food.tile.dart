// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../model/food.dart';

class FoodTile extends StatelessWidget {
  final Food food; 
  final void Function()? onTap; 
  
  const FoodTile({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column
    (children: [
      GestureDetector(
        onTap: onTap, 
        child: Row(
          children: [
            Expanded(
              child: Column(
              children: [
                Text(food.name), 
              ],
            ))
          ],
        ),
      )
    ],);
  }
}
