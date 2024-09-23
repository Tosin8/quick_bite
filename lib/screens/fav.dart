import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drawer/app_drawer.dart';
import 'fav_state.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final favoriteProducts = Provider.of<FavoriteProvider>(context).favorites;
    
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorites")),
      drawer: const AppDrawer(),
      body: favoriteProducts.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (ctx, i) {
                final product = favoriteProducts[i];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Image.network(
                          product.image, // Assuming product has an imageUrl property
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 10),
                        // Product Name
                        Text(
                          product.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        // Product Price
                        Text(
                          '\$${product.price}', // Assuming product has a price property
                          style: const TextStyle(color: Colors.green, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        // Product Description
                        Text(
                          product.description, // Assuming product has a description property
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        // Favorite Icon Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              product.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: product.isFavorite ? Colors.red : null,
                            ),
                            onPressed: () {
                              // Toggle favorite status
                              Provider.of<FavoriteProvider>(context, listen: false)
                                  .toggleFavorite(product);

                              // Show a Scaffold message
                              final snackBar = SnackBar(
                                content: Text(
                                  '${product.name} has been removed from favorites.',
                                ),
                                duration: const Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
