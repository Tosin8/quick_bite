import 'package:flutter/material.dart';

class AppCurrentLocation extends StatelessWidget {
  const AppCurrentLocation({super.key});

void openLocationSearchBox(BuildContext context) {
  showDialog(context: context, 
  builder: (context) => AlertDialog(
    title: const Text('Your location'), 
    content: const TextField(decoration: InputDecoration(
      prefixIcon: Icon(Icons.location_on),
      hintText: 'Search Address'),
    ), 
    actions: [
      TextButton(
        child: const Text('Search'),
        onPressed: () => Navigator.pop(context),
  ), 
    TextButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.pop(context),
  ), ]
  ));
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Delivery Address', 
          style: TextStyle(color: Colors.grey),), 
          // address
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: const Row(
              children: [
                Text('6901 Hollywood Blv', 
                style: TextStyle(fontWeight: FontWeight.bold),),
                 // drop down menu
            Icon(Icons.keyboard_arrow_down_rounded), 
              ],
            ),
          ), 
      
         
        ],
      ),
    );
  }
}