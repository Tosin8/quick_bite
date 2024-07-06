// import 'package:cloud_firestore/cloud_firestore.dart';

// class Food {
//   final String id;
//   final String name;
//   final String description;
//   final String image;
//   final double price;

//   Food({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.price, required FoodCategory category, required List<dynamic> availableAddons,
//   });

//   factory Food.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Food(
//       id: doc.id,
//       name: data['name'],
//       description: data['description'],
//       image: data['image'],
//       price: data['price'], category: FoodCategory.values.firstWhere((e) => e.toString() == 'FoodCategory.${data['category']}'), availableAddons: [],
//     );
//   }
// }

// enum FoodCategory{
//   burgers, 
//   salads, 
//   chicken,
//   sandwish, 
//   dessert, 
//   drinks, 
// }
// class Addon {
//   String name; 
//   double price; 
//   Addon({
//     required this.name,
//     required this.price,
//   });
// }