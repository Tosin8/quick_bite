// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:quick_bite/model/food.dart';

// class Restaurant extends ChangeNotifier {
//   List<Food> _foods = [];
//   List<Food> get foods => _foods;

//   List<Food> _favorites = [];
//   List<Food> get favorites => _favorites;

//   bool _isLoading = true;
//   bool get isLoading => _isLoading;

//   Restaurant() {
//     fetchFoods();
//   }

//   Future<void> fetchFoods() async {
//     final querySnapshot = await FirebaseFirestore.instance.collection('products').get();
//     _foods = querySnapshot.docs.map((doc) => Food.fromFirestore(doc)).toList();
//     _isLoading = false;
//     notifyListeners();
//   }

//   void toggleFavorite(Food food) {
//     if (_favorites.contains(food)) {
//       _favorites.remove(food);
//     } else {
//       _favorites.add(food);
//     }
//     notifyListeners();
//   }

//   bool isFavorite(Food food) {
//     return _favorites.contains(food);
//   }
// }
