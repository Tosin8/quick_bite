import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:quick_bite/components/form/app_button.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

GlobalKey<FormState> formKey = GlobalKey<FormState>();
String cardNumber = ''; 
String expiryDate = ''; 
String cardHolderName = '';
String cvvCode = '';
bool isCvvFocused = false; 

// user wants to pay. 

void userTappedPay(){
  if (formKey.currentState!.validate()) {
    // only show dialog if form is valid. 
    showDialog(context: context,
     builder: (context) => AlertDialog(
      title: const Text('Confirm Payment?'), 
      content: SingleChildScrollView(
        child: ListBody( 
          children: [
            Text('Card Number: $cardNumber'),
            Text('Expiry Date: $expiryDate'),
            Text('Card Holder Name: $cardHolderName'),
            Text('CVV: $cvvCode'),
          ],
        ),
      ),
      actions: [

        // Yes Button. 
        TextButton(
          onPressed: () { 
            Navigator.pop(context); 
            Navigator.push(context,MaterialPageRoute(builder: (context) => const DeliveryProgressPage())); 
          }, 
         child: const Text('Yes, Pay')), 

          // No Button. 
        TextButton(
          onPressed: () => Navigator.pop(context), 
         child: const Text('Cancel')), 
      ],
     ));
  }
}
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Credit Card
            CreditCardWidget(
              cardNumber: cardNumber,
               expiryDate: expiryDate, 
               cardHolderName: cardHolderName, 
               cvvCode: cvvCode, 
               showBackView: isCvvFocused, onCreditCardWidgetChange: (p0){}, 
               ), 
        
               // Credit Card Form
               CreditCardForm(
                cardNumber: cardNumber, 
                expiryDate: expiryDate, 
                cardHolderName: cardHolderName,
                 cvvCode: cvvCode, 
                 onCreditCardModelChange: (data){
        setState(() {
          cardNumber = data.cardNumber;
          expiryDate = data.expiryDate;
          cardHolderName = data.cardHolderName;
          cvvCode = data.cvvCode;
          isCvvFocused = data.isCvvFocused;
          
        });
                 }, 
                 formKey: formKey), 
                 const SizedBox(height: 30,), 
                 AppButton(
                  text: 'Pay Now',
                   onTap: userTappedPay
                   ),
          ],
        
          
        ),
      )
    );
  }
}