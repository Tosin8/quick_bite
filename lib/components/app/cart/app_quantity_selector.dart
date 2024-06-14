// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quick_bite/model/food.dart';

class AppQuantitySelector extends StatelessWidget {
  final int quantity; 
  final Food food; 
  final VoidCallback onIncrement; 
  final VoidCallback onDecrement; 

  const AppQuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all
        (color: Colors.white), 
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
