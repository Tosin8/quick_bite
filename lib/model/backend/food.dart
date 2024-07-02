import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  final String id;
  final String name;
  final double price;
  final String details;
  final String imageUrl;
  final FoodCategory category;
  final List<AddOn> addOns;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.details,
    required this.imageUrl,
    required this.category,
    required this.addOns,
  });

  factory Food.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var addOnsFromFirestore = (data['addOns'] as List)
        .map((addOn) => AddOn.fromMap(addOn))
        .toList();

    return Food(
      id: doc.id,
      name: data['name'],
      price: data['price'],
      details: data['details'],
      imageUrl: data['imageUrl'],
      category: FoodCategory.values.firstWhere((e) => e.toString() == 'FoodCategory.' + data['category']),
      addOns: addOnsFromFirestore,
    );
  }
}

class AddOn {
  final String name;
  final double price;

  AddOn({required this.name, required this.price});

  factory AddOn.fromMap(Map<String, dynamic> data) {
    return AddOn(
      name: data['name'],
      price: data['price'],
    );
  }
}

enum FoodCategory {
  burgers,
  salads,
  chicken,
  sandwich,
  dessert,
}
