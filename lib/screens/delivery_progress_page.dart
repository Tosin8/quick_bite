import 'package:flutter/material.dart';
import 'package:quick_bite/screens/cart_page.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage())),
          icon: const Icon(Icons.arrow_back_ios)), 
        title: const Text('Delivery in progress'),
      ),
    );
  }
}