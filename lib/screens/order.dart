import 'package:QuickBite/components/drawer/app_drawer.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: AppBar(title: const Text("Your Orders")),
      drawer: const AppDrawer(),
      body: const Center(child: Text('Order is empty')), 
    );
  }
}