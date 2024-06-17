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
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem.food.name, 
                         
                          
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      
                          const SizedBox(height: 5,), 
                                      
                          Text('\$${cartItem.food.price.toString()}', 
                          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
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
                    
                    const Spacer(), 
                
                    // increment or decrement quantity. 
                    // AppQuantitySelector(
                    //   quantity: cartItem.quantity, 
                    //   food: cartItem.food, 
                    //   onDecrement: (){
                    //     restaurant.removeFromCart(cartItem); 
                    //   },
                    //    onIncrement: (){
                    //      restaurant.addToCart(cartItem.food, cartItem.selectedAddons); 
                    //    }
                    //    ), 
                  ],
                ),
              ),

              // addons 
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60, 
                child: ListView(
                  scrollDirection: Axis.horizontal, 
                  physics: const BouncingScrollPhysics(),
               
                  padding: const EdgeInsets.only(left: 10, right: 10,bottom: 10),
                  children: cartItem.selectedAddons
                  .map(
                    (addon) => Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: FilterChip(
                      label:  Row(
                        children: [
                      
                          // addon name
                      Text(addon.name), 
                      const SizedBox(width: 5,),     // addon price
                      Text('\$${addon.price.toString()}'),
                        ],
                        ), 
                        shape: const StadiumBorder(side: BorderSide(color: Colors.black)), 
                        onSelected: (value) {},
                        backgroundColor: Colors.white, labelStyle: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
                                        ),
                    )).toList(), 
                ),
              ), 
            ],
          )
        )
    );
  }
}
