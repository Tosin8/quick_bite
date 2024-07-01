import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('FAQ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const Text('Our FAQ section, answers most popular questions customers ask. We have a lot of questions, so we want to make this section as helpful as possible.\nWe hope you find our answers helpful.'),
            const SizedBox(height: 10,),

            // place an order
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: const Text('Place an Order'),
              onExpansionChanged: (bool expanded) {
                if (expanded) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              trailing: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5)
                    .animate(_animationController),
                child: const Icon(Icons.expand_more),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text('To place an order with us, start by exploring our diverse range of products. Once you\'ve found what you\'re looking for, simply add it to your cart.\nProceed to checkout where you\'ll enter your shipping details and select a payment method. Finally, confirm your order by clicking the "Place Order" button.'),
                ),

              ],
            ),

// payment options. 
  const SizedBox(height: 10,),
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: const Text('Payment Options'),
              onExpansionChanged: (bool expanded) {
                if (expanded) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              trailing: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5)
                    .animate(_animationController),
                child: const Icon(Icons.expand_more),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text('To make shopping easier for you, we provide various secure methods to complete your purchase. You can pay using major credit and debit cards, popular mobile wallets like Apple Pay and Google Pay, PayPal for added convenience, direct bank transfers, or opt for cash on delivery where available. \nYour transactions are always secured with encryption to protect your information. If you have any questions regarding our payment methods, our customer support team is ready to assist you.'),
                ),

              ],
            ),

            
// delivery timelines. 
  const SizedBox(height: 10,),
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: const Text('Delivery Timeline'),
              onExpansionChanged: (bool expanded) {
                if (expanded) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              trailing: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5)
                    .animate(_animationController),
                child: const Icon(Icons.expand_more),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text('Our delivery times vary depending on factors such as your location and the shipping method selected. We strive to ensure your order reaches you promptly. \nUpon placing your order, you will receive an estimated delivery timeframe based on these factors. For specific inquiries about delivery times or to track your order, please reach out to our customer support team, who will be happy to assist you.'),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}