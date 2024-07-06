import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  factory Food.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Food(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      image: data['image'],
      price: data['price'],
    );
  }
}
