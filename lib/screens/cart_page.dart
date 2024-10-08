// import 'package:QuickBite/components/app/cart/app_cart_tile.dart';
// import 'package:QuickBite/components/form/app_button.dart';
// import 'package:QuickBite/model/restaurant.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../services/payment/payment_page.dart';
// import 'package:uuid/uuid.dart';


// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Restaurant>(
//       builder: (context, restaurant, child) {
// // cart
// final userCart = restaurant.cart;
// // 
// // Assuming email is part of the restaurant model
//         final totalPrice = restaurant.getTotalPrice();
//         final String reference = const Uuid().v4(); // Generate a unique reference for each payment

//         return Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               onPressed:() => Navigator.pop(context),
//              icon: const Icon(Icons.arrow_back_ios)), 

//             title: const Text('Cart'), 
//             centerTitle: true,
//             backgroundColor: Colors.transparent,
//             actions: [

//               // clear all cart items.
//               IconButton(onPressed: () {
// showDialog(context: context,
//  builder: (context) =>  AlertDialog(
//   title: const Text('Clear cart?'),
//   actions: [

//     // Yes Button 
//     TextButton(onPressed: (){
//       Navigator.pop(context); 
//       restaurant.clearCart(); 
//     }, 
//     child: const Text('Yes')),

//     // No Button
//     TextButton(onPressed: (){
//       Navigator.pop(context);
//     }, 
//     child: const Text('Cancel'))
//   ],
//  ));

//               }, icon: const Icon(Icons.delete_forever))
//             ],
//           ), 
//           body: Column(
//             children: [
//               Expanded(
//                 child: Column(
                
//                   // List of Cart Items.
//                   children: [
//                     userCart.isEmpty ? const Expanded(child: Center(child: Text('Cart is empty ...'))): 
//                     Expanded(child: ListView.builder(
//                             itemCount: userCart.length,
//                       itemBuilder: (context, index)  { 
                
//                         // get individual cart item. 
//                         final cartItem = userCart[index];
                
//                         return 
//                       AppCartTile(cartItem: cartItem); 
//                        } )),
//                   ],
//                 ),
//               ),

//               // Button to Pay. 
//               // AppButton( text: 'Checkout',  
//               // onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const PaymentPage())),

//               AppButton( text: 'Checkout  \$${restaurant.getTotalPrice().toStringAsFixed(2)}',  
//               onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>  PaymentPage(
//                 amount: totalPrice.toString(),
                        
//                           reference: reference,))),
              
//               ), 
//               const SizedBox(height: 20,), 
//             ],
//           )
//         ); 

//       }
//     ); 
//   }
// }


import 'package:QuickBite/components/app/cart/app_cart_tile.dart';
import 'package:QuickBite/components/form/app_button.dart';
import 'package:QuickBite/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:QuickBite/services/payment/payment_page.dart';
import 'package:uuid/uuid.dart'; // Add this for generating unique references

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;
       
        final totalPrice = restaurant.getTotalPrice();
        final String reference = const Uuid().v4(); // Generate a unique reference for each payment

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text('Cart'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: [
              // clear all cart items.
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Clear cart?'),
                      actions: [
                        // Yes Button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text('Yes'),
                        ),
                        // No Button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete_forever),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  // List of Cart Items.
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text('Cart is empty ...'),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // Get individual cart item.
                                final cartItem = userCart[index];
                                return AppCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              // Button to Pay.
              AppButton(
                text: 'Checkout \$${totalPrice.toStringAsFixed(2)}',
                onTap: () {
                  if (totalPrice > 0 
                  //&& userEmail.isNotEmpty
                  
                  ) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          amount: totalPrice.toString(),
                      
                          reference: reference,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cannot proceed to payment with an empty cart or missing email'),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
