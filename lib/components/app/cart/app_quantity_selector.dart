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
       // color: Colors.grey[300],  
    
        borderRadius: BorderRadius.circular(5),
      ),
//padding: const EdgeInsets.all(8), 
child: Row(
  mainAxisSize: MainAxisSize.min,
  children: [

    // Decrease Button. 
GestureDetector(
  onTap: onDecrement, 
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
       color: Colors.grey[300], 
    ),
    child: const Icon(Icons.remove,
     size: 20, 
     color: Colors.white,
     ),
  ),
), 

// Quantity Count
Padding(
  padding: const EdgeInsets.all(8), 
child: SizedBox(
  width: 20,
  child: Center(
    child: Text(quantity.toString()),
  ),
),), 

// Increase Button. 
GestureDetector(
  onTap: onIncrement, 
  child: Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300], ),
    child: const Icon(Icons.add,
     size: 20, 
     color: Colors.white,
     ),
  ),
),
  ],
),
    );
  }
}
