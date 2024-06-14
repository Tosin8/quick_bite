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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [ 
              // food details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name), 
                  Text('\$${food.price}',
                   style: const TextStyle(color: Colors.grey),), 
                   const SizedBox(height: 10,), 
                  Text(food.description,
                   style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),), 
                ],
              )), 
          
          const SizedBox(width: 10,), 
              // image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(food.image,height: 120,)), 
            ],
          ),
        ),
      ), 

      // divider
     const  Divider(color: Colors.grey,
      endIndent: 25, indent: 25,
      ), 
    ],);
  }
}
