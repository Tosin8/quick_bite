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
          children: const [
            Text('Our FAQ section, answers most popular questions customers ask. We have a lot of questions, so we want to make this section as helpful as possible.\nWe hope you find our answers helpful.'),
            SizedBox(height: 20,),

            // place an order
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: Text('Place an Order'),
              
              children: <Widget>[
                ListTile(
                  title: Text('To place an order with us, start by exploring our diverse range of products. Once you\'ve found what you\'re looking for, simply add it to your cart.\nProceed to checkout where you\'ll enter your shipping details and select a payment method. Finally, confirm your order by clicking the "Place Order" button.'),
                ),

              ],
            ),

// payment options. 
  SizedBox(height: 10,),
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: Text('Payment Options'),
              
              children: <Widget>[
                ListTile(
                  title: Text('To make shopping easier for you, we provide various secure methods to complete your purchase. You can pay using major credit and debit cards, popular mobile wallets like Apple Pay and Google Pay, PayPal for added convenience, direct bank transfers, or opt for cash on delivery where available. \nYour transactions are always secured with encryption to protect your information. If you have any questions regarding our payment methods, our customer support team is ready to assist you.'),
                ),

              ],
            ),

            
// delivery timelines. 
  SizedBox(height: 10,),
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: Text('Delivery Timeline'),
             
              children: <Widget>[
                ListTile(
                  title: Text('Our delivery times vary depending on factors such as your location and the shipping method selected. We strive to ensure your order reaches you promptly. \nUpon placing your order, you will receive an estimated delivery timeframe based on these factors. For specific inquiries about delivery times or to track your order, please reach out to our customer support team, who will be happy to assist you.'),
                ),

              ],
            ),

            // track an order
  SizedBox(height: 10,),
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: Text('Track an Order'),
             
              children: <Widget>[
                ListTile(
                  title: Text('Tracking your order is easy! Once your order has been shipped, you\'ll receive a confirmation email with a tracking number and instructions on how to track your package. \nSimply click on the tracking link provided in the email or visit our website and enter your order number and email address in the designated tracking section. \nIf you have any questions or need further assistance, our customer support team is available to help.'),
                ),

              ],
            ),

            // cancel an order
  SizedBox(height: 10,),
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: Text('Cancel an Order'),
             
              children: <Widget>[
                ListTile(
                  title: Text('Changed your mind? No problem! \nTo cancel your order, please contact our customer support team as soon as possible. Provide your order number and details, and we\'ll assist you in canceling your order promptly. \nIf your order has already been processed for shipment, we\'ll guide you through our return or cancellation policy to ensure your satisfaction. Our team is here to help with any questions or concerns you may have regarding your order cancellation.'),
                ),

              ],
            ),

            
            // about is
  SizedBox(height: 10,),
            ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              title: Text('About Us'),
             
              children: <Widget>[
                ListTile(
                  title: Text('Welcome to Quick Bite, your go-to destination for delicious, freshly prepared meals delivered right to your doorstep. Established with a passion for convenience and quality, Quick Bite aims to satisfy your cravings with a diverse menu of flavorful dishes. \nWhether you\'re looking for a quick lunch, a family dinner, or a tasty snack, our commitment to fast, reliable service ensures that you get your favorite meals swiftly and with a smile. Explore our menu and experience the convenience of ordering food online with Quick Bite today!'),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}