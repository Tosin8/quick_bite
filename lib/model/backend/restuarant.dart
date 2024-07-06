// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:quick_bite/backend/food.dart';

// class Restaurant extends ChangeNotifier {
//   List<Food> _menu = [];

//   List<Food> get menu => _menu;
//   final List<Food> _favorites = [];

//   List<Food> get favorites => _favorites;

//   Restaurant() {
//     fetchMenu();
//   }

//   Future<void> fetchMenu() async {
//     final QuerySnapshot result = await FirebaseFirestore.instance.collection('products').get();
//     final List<DocumentSnapshot> documents = result.docs;

//     _menu = documents.map((doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       return Food(
//         name: data['name'],
//         description: data['description'],
//         image: data['image'],
//         price: data['price'],
//         category: FoodCategory.values.firstWhere((e) => e.toString() == data['category']),
//         availableAddons: (data['availableAddons'] as List<dynamic>).map((addon) {
//           return Addon(name: addon['name'], price: addon['price']);
//         }).toList(), id: '${doc.id}',
//       );
//     }).toList();

//     notifyListeners();
//   }

//   void addToCart(Food food, List<Addon> selectedAddons) {
//     // Add food to the cart
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


