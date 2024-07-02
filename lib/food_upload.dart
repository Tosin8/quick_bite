import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> uploadFoodDetails() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  final Map<String, List<Map<String, dynamic>>> categories = {
    'burgers': [
      {'name': 'Classic Cheeseburger', 'price': 0.99, 'details': 'A juicy beef patty topped with melted cheese, lettuce, tomato, onions, pickles, ketchup, and mustard on a toasted bun.', 'imagePath': 'assets/images/cheeseburger.jpg'},
      // Add more burgers
    ],
    'salads': [
      {'name': 'Caesar Salad', 'price': 7.99, 'details': 'Fresh Caesar Salad', 'imagePath': 'assets/images/caesar_salad.jpg'},
      // Add more salads
    ],
    // Other categories
  };

  for (var category in categories.keys) {
    for (var item in categories[category]!) {
      String imageUrl = await uploadImageToStorage(storage, item['imagePath']);
      await firestore.collection('foods').add({
        'name': item['name'],
        'price': item['price'],
        'details': item['details'],
        'imageUrl': imageUrl,
        'category': category,
        'addOns': [], // Handle add-ons similarly
      });
    }
  }
}

Future<String> uploadImageToStorage(FirebaseStorage storage, String imagePath) async {
  File imageFile = File(imagePath);
  Reference ref = storage.ref().child('food_images').child(imagePath.split('/').last);
  UploadTask uploadTask = ref.putFile(imageFile);
  TaskSnapshot snapshot = await uploadTask;
  return await snapshot.ref.getDownloadURL();
}