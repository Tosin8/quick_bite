import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // get collections of orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders'); 

  static final _firestore = FirebaseFirestore.instance;
}