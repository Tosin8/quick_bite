import 'package:flutter/material.dart';

class AppReceipt extends StatelessWidget {
  const AppReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25), 
      child: Center(
        child: Column(
          children: [
            Text('Thank you for your order!',), 
            SizedBox(height: 25,), 
            
          ],
        )
      )
    );
  }
}