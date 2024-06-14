import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],
     
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        title: const Text('Checkout'), 
        centerTitle: true,
         leading: IconButton(
        onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios))
      ),
      body: Column(
        children: [
          // Credit Card
        ],
      )
    );
  }
}