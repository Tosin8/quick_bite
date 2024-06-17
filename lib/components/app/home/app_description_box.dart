import 'package:flutter/material.dart';

class AppDescriptionBox extends StatelessWidget {
  const AppDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all
          (color: Colors.white), 
          borderRadius: BorderRadius.circular(8), 
        ),
        padding: const EdgeInsets.all(20),
         
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // delivery fee
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$10.00', 
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text('Delivery Fee',
                style: TextStyle(color: Colors.grey),)
              ],
            ), 
      SizedBox(width: 20,), 
            // delivery time
            Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('30 - 45 min', 
                 
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text('Delivery Time',
                style: TextStyle(color: Colors.grey),)
              ],
            ), 
          ],
        ),
      ),
    );
  }
}