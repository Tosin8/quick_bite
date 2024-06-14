import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/model/restaurant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
// cart
final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed:() => Navigator.pop(context),
             icon: Icon(Icons.arrow_back_ios)), 

            title: Text('Cart'), 
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ), 
          body: Column(
            children: [
              Expanded(child: ListView.builder(
                      itemCount: userCart.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(userCart[index].food.name),
                  )
          )),
            ],
          )
        ); 

      }
    ); 
  }
}