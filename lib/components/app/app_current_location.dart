import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/model/restaurant.dart';

class AppCurrentLocation extends StatefulWidget {
  const AppCurrentLocation({super.key});

  @override
  State<AppCurrentLocation> createState() => _AppCurrentLocationState();
}

class _AppCurrentLocationState extends State<AppCurrentLocation> {
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
        child: Text('Save'),
        onPressed: () {

          // update delivery address
          String newAddress = textController.text; 
          context.read<Restaurant>().updateDeliveryAddress(newAddress);
          Navigator.pop(context); 
          textController.clear(); 
        }
  ), 
    TextButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.pop(context),
  ), ]
  ));
}

  final textController = TextEditingController();
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
            child: Row(
              children: [
              Consumer<Restaurant> (
               builder: (context, restaurant, child) =>  Text(restaurant.deliveryAddress, 
                style: const TextStyle(fontWeight: FontWeight.bold),),
               ),  // drop down menu
            const Icon(Icons.keyboard_arrow_down_rounded), 
              ],
            ),
          ), 
      
         
        ],
      ),
    );
  }
}