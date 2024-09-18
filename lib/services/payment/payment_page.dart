// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:QuickBite/services/payment/payment_model.dart';
import 'package:QuickBite/services/payment/paystack/auth_response.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.amount,
    required this.email,
    required this.reference,
  });


final String amount; 
final String email; 
final String reference; 
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  // create a function for creating transaction. 
  Future<PayStackAuthResponse> createTransaction(Transaction transaction) async {

    const String url = 'https://api.paystack.co/initialize'; 
    final data = transaction.toJson(); 

    try {
      final response = await http.post(Uri.parse(url), headers: {

      }); 
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}