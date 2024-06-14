// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../model/food.dart';

class FoodPage extends StatefulWidget {
  final Food food; 
  const FoodPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // food image
          Image.asset(widget.food.image), 

          // food name
          Text(widget.food.name), 

          // food description
          Text(widget.food.description), 

          // addons. 

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index){

              //get individual addon
              Addon addon = widget.food.availableAddons[index];
              return CheckboxListTile(
                title: Text(addon.name),
                subtitle: Text(addon.price.toString()),
                value: false, 
                onChanged: (value){}); 
            })
        ],
      ),
    );
  }
}
