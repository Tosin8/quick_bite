import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/model/restaurant.dart';

class AppReceipt extends StatelessWidget {
  const AppReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 25, bottom: 25, ), 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for your order!',), 
            const SizedBox(height: 25,), 
            Container(
              decoration: BoxDecoration(
                border: Border.all(color:
                Colors.white, width: 3), 
                borderRadius: BorderRadius.circular(8), 

              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant> (
                builder: (context, restaurant, child) => 
                Text(restaurant.displayCartReceipt()),
              ),
            ),
            const SizedBox(height: 10,),  
            const Text('Estimated Delivery Time: 30 Mins')

          ],
        )
      )
    );
  }
}