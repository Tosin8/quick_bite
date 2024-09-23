import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drawer/app_drawer.dart';
import 'fav_state.dart';

// // favs. screen. 

class FavScreen extends StatelessWidget {
   const FavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final favoriteProducts = Provider.of<FavoriteProvider>(context).favorites;
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorites"), 
    
      ),
        drawer: const AppDrawer(),
      body: favoriteProducts.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(favoriteProducts[i].name),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    Provider.of<FavoriteProvider>(context, listen: false)
                        .toggleFavorite(favoriteProducts[i]);
                  },
                ),
              ),
            ),
    );
  }
}
