import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/components/form/app_button.dart';
import 'package:quick_bite/model/restaurant.dart';
import 'package:quick_bite/screens/home.dart';

class AppReceipt extends StatelessWidget {
  const AppReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 25, bottom: 25,top: 20 ), 
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Thank you for your order!',), 
              const SizedBox(height: 15,), 
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
              const SizedBox(height: 7,),  
              const Text('Estimated Delivery Time: 30 Mins'), 
              const SizedBox(height: 5,),
             
              AppButton(text:  'Return to Home',
               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()))), 
          
            ],
          ),
        )
      )
    );
  }
}