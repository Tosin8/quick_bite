import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/backend/food.dart';


import '../model/backend/restuarant.dart';



class ProductDetailScreen extends StatelessWidget {
  final Food food;

  ProductDetailScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        actions: [
          IconButton(
            icon: Icon(
              restaurant.isFavorite(food) ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              restaurant.toggleFavorite(food);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(food.image),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              food.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Price: \$${food.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
