import 'package:QuickBite/components/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
// class FavScreen extends StatelessWidget {
//   const FavScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//         title: const Text('Favorites'), 
//         centerTitle: true,
//       ),
//       drawer: const AppDrawer(),
//       body: const Center(child: Text('Fav Screen'))
//     );
//   }
// }

// // favs. screen. 

class FavScreen extends StatelessWidget {
   const FavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final favoriteProducts = Provider.of<FavoriteProvider>(context).favorites;
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorites")),
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
