// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quick_bite/components/app/cart/app_quantity_selector.dart';
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
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem.food.name, 
                          softWrap:false ,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      
                          const SizedBox(height: 3,), 
                                      
                          Text('\$${cartItem.food.price.toString()}', 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                        ],
                      ),
                    ), 
                    const Spacer(), 
                
                    // increment or decrement quantity. 
                    AppQuantitySelector(
                      quantity: cartItem.quantity, 
                      food: cartItem.food, 
                      onDecrement: (){
                        restaurant.removeFromCart(cartItem); 
                      },
                       onIncrement: (){
                         restaurant.addToCart(cartItem.food, cartItem.selectedAddons); 
                       }
                       ), 
                  ],
                ),
              ),

              // addons 
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60, 
                child: ListView(
                  scrollDirection: Axis.horizontal, 
                  children: cartItem.selectedAddons
                  .map(
                    (addon) => FilterChip(
                    label: const Row(
                      children: [],
                      ), 
                      onSelected: (value) {},
                  )).toList(), 
                ),
              ), 
            ],
          )
        )
    );
  }
}
