// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quick_bite/model/cart_item.dart';
import 'package:quick_bite/model/restaurant.dart';

class AppCartTile extends StatelessWidget {
  final CartItem cartItem; 
  const AppCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => 
         Container(
          child: Column(
            children: [
              Row(
                children: [

                  // food image. 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cartItem.food.image, 
                    height: 100, 
                    width: 100,),
                  ), 
const SizedBox(width: 10,), 
                  // name and price. 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

                      const SizedBox(height: 3,), 

                      Text('\$${cartItem.food.price.toString()}', 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ],
                  )

                  // increment or decrement quantity. 
                ],
              ),

              // addons 
            ],
          )
        )
    );
  }
}
