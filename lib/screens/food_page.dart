// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quick_bite/components/form/app_button.dart';

import '../model/food.dart';

class FoodPage extends StatefulWidget {
  final Food food; 
  final Map<Addon, bool> selectedAddons = {};
   FoodPage({
    super.key,
    required this.food,
  }){
    //  initialize selected addons to be false.
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(
    //   leading: IconButton(onPressed: () => Navigator.pop(context), 
    //   icon: Icon(Icons.arrow_back_ios)), 
    // ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            // food image
            Image.asset(widget.food.image), 
      
            // food name
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.food.name, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              
      const SizedBox(height: 10,), 
              // food price 
              Text('\$${widget.food.price}',
               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),), 
              const SizedBox(height: 8,), 
                    // food description
              Text(widget.food.description, 
              style: const TextStyle(color: Colors.black, fontSize: 14),), 
              
              const SizedBox(height: 10,),
              const Divider(color: Colors.white, thickness: 2,), 
              const SizedBox(height: 10,),
              const Text('Add-ons',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),), 
              
              // addons. 
              
                  ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.food.availableAddons.length,
                itemBuilder: (context, index){
              
                  //get individual addon
                  Addon addon = widget.food.availableAddons[index];
                  return CheckboxListTile(
                    title: Text(addon.name),
                    subtitle: Text('\$${addon.price}'),
                    value: false, 
                    onChanged: (value){}); 
                })
                ],
              ),
            ), 
      
          
      // add to cart button
      AppButton(text: 'Add to cart', onTap: () {},), 
      const SizedBox(height: 30,), 
        
          ],
        ),
    ),
    );
  }
}
