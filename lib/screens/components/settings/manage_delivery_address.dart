import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ManageDeliveryAddressesScreen extends StatefulWidget {
  @override
  _ManageDeliveryAddressesScreenState createState() => _ManageDeliveryAddressesScreenState();
}

class _ManageDeliveryAddressesScreenState extends State<ManageDeliveryAddressesScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _addresses = [];

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        _addresses = List<String>.from(userDoc['addresses'] ?? []);
      });
    }
  }

  Future<void> _saveAddress(String address) async {
    User? user = _auth.currentUser;
    if (user != null) {
      _addresses.add(address);
      await _firestore.collection('users').doc(user.uid).update({
        'addresses': _addresses,
      });
      _loadAddresses();
    }
  }

  Future<void> _deleteAddress(String address) async {
    User? user = _auth.currentUser;
    if (user != null) {
      _addresses.remove(address);
      await _firestore.collection('users').doc(user.uid).update({
        'addresses': _addresses,
      });
      _loadAddresses();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Delivery Addresses'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          for (String address in _addresses)
            ListTile(
              title: Text(address),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteAddress(address),
              ),
            ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Add new address',
            ),
            onSubmitted: _saveAddress,
          ),
        ],
      ),
    );
  }
}
