// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:quick_bite/backend/food.dart';

// import 'productdetail.dart';

// class HomeScreenB extends StatelessWidget {
//   final List<String> categories = ['Burgers', 'Salads', 'Chicken', 'Sandwich', 'Desserts', 'Drinks'];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: categories.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Quick Bite'),
//           bottom: TabBar(
//             isScrollable: true,
//             tabs: categories.map((category) => Tab(text: category)).toList(),
//           ),
//         ),
//         body: TabBarView(
//           children: categories.map((category) {
//             return FoodCategoryTab(category: category);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class FoodCategoryTab extends StatelessWidget {
//   final String category;

//   const FoodCategoryTab({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('products').where('category', isEqualTo: category).snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('No items available'));
//         }

//         return GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.75,
//           ),
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             final foodData = snapshot.data!.docs[index];
//             final food = Food(
//               id: foodData.id,
//               name: foodData['name'],
//               description: foodData['description'],
//               image: foodData['image'],
//               price: foodData['price'],
//               category: FoodCategory.values.firstWhere((e) => e.toString() == 'FoodCategory.${foodData['category']}'),
//               availableAddons: (foodData['availableAddons'] as List)
//                   .map((addon) => Addon(name: addon['name'], price: addon['price']))
//                   .toList(), 
//             );

//             return FoodItemTile(food: food);
//           },
//         );
//       },
//     );
//   }
// }

// class FoodItemTile extends StatelessWidget {
//   final Food food;

//   const FoodItemTile({required this.food});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => ProductDetailScreen(food: food),
//         ));
//       },
//       child: Card(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Image.network(food.image, fit: BoxFit.cover),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(food.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 4),
//                   Text('\$${food.price.toStringAsFixed(2)}'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
