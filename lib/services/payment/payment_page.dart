
import 'dart:convert';

import 'package:QuickBite/services/payment/payment_model.dart';
import 'package:QuickBite/services/payment/paystack/auth_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import 'apikey.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.amount,
    this.email = 'tosinezekiel8@gmail.com',
    required this.reference,
  });

  final String amount;
  final String email;
  final String reference;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // Create a function for creating transaction.
  Future<PayStackAuthResponse> createTransaction(Transaction transaction) async {
    const String url = 'https://api.paystack.co/initialize';
    final data = transaction.toJson();

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${Apikey.secretKey}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return PayStackAuthResponse.fromJson(responseData['data']);
      } else {
        throw 'Payment Unsuccessful';
      }
    } catch (e) {
      throw 'Payment Unsuccessful: $e';
    }
  }

  Future<String> initializeTransaction() async {
    try {
      final price = double.parse(widget.amount);
      final transaction = Transaction(
        amount: (price * 100).toString(), // Amount in kobo (NGN)
        reference: widget.reference,
        currency: 'NGN',
        email: widget.email,
      );
      final authResponse = await createTransaction(transaction);
      return authResponse.authorizaton_url;
    } catch (e) {
      print('Error initializing transaction: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paystack Payment'),
      ),
      body: SafeArea(
        child: FutureBuilder<String>(
          future: initializeTransaction(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError || snapshot.data == '') {
              return Center(
                child: Text('Error: ${snapshot.error ?? "Failed to initialize transaction"}'),
              );
            } else if (snapshot.hasData) {
              final url = snapshot.data;

              return WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
                        // Update loading bar if needed
                      },
                      onPageStarted: (String url) {},
                      onPageFinished: (String url) {},
                      onHttpError: (HttpResponseError error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failed to load page')),
                        );
                      },
                      onWebResourceError: (WebResourceError error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error loading payment page')),
                        );
                      },
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url.startsWith('https://www.youtube.com/')) {
                          return NavigationDecision.prevent;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(Uri.parse(url!)),
              );
            } else {
              return const Center(
                child: Text('Unexpected error occurred'),
              );
            }
          },
        ),
      ),
    );
  }
}
