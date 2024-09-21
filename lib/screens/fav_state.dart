import 'package:flutter/material.dart';

import '../model/food.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Food> _favorites = [];

  List<Food> get favorites => _favorites;

  void toggleFavorite(Food food) {
    if (_favorites.contains(food)) {
      _favorites.remove(food);
      food.isFavorite = false;
    } else {
      _favorites.add(food);
      food.isFavorite = true;
    }
    notifyListeners();
  }
}
