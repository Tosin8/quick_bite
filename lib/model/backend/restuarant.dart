import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/model/backend/food.dart';

class Restaurant with ChangeNotifier {
  List<Food> menu = [];

  void setMenu(List<Food> newMenu) {
    menu = newMenu;
    notifyListeners();
  }

  Future<void> fetchMenu() async {
    var snapshot = await FirebaseFirestore.instance.collection('foods').get();
    var foods = snapshot.docs.map((doc) => Food.fromFirestore(doc)).toList();
    setMenu(foods);
  }
}
