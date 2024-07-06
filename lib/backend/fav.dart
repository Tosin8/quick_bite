import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/model/backend/restuarant.dart';


import 'productdetail.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: restaurant.favorites.isEmpty
          ? const Center(child: Text('No favorite items yet.'))
          : ListView.builder(
              itemCount: restaurant.favorites.length,
              itemBuilder: (context, index) {
                final food = restaurant.favorites[index];
                return ListTile(
                  leading: Image.network(food.image),
                  title: Text(food.name),
                  subtitle: Text('\$${food.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(food: food),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
