import 'package:flutter/material.dart';

class AppCurrentLocation extends StatelessWidget {
  const AppCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Deliver Now'), 
        // address
        Row(
          children: [
            Text('6901 Hollywood Blv'),
             // drop down menu
        Icon(Icons.keyboard_arrow_down_rounded), 
          ],
        ), 

       
      ],
    );
  }
}