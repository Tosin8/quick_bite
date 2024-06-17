import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/model/restaurant.dart';
import 'package:quick_bite/screens/components/app_receipt.dart';
import 'package:quick_bite/services/database/firestore.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  // get access to db

  FirestoreService db = FirestoreService(); 

  @override
  void initState() {
    
    super.initState(); 

    // get the order to db. 
    String receipt = context.read<Restaurant>().displayCartReceipt(); 
    db.saveOrderToDatabase(receipt); 

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () => Navigator.pop(context),
        //   icon: const Icon(Icons.arrow_back_ios)), 
        title: const Text('Delivery in progress'),
      ),

      bottomNavigationBar: _buildBottomNavBar(context),
      body: const AppReceipt(), 
    );
  }

  // Custom Botom Nav Bar - Message / Call Delivery Driver. 
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), 
          topRight: Radius.circular(40), 
        )
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
          children: [
        
            // profile pic of the driver
            Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle, 
        ),
        child: IconButton(
          onPressed: (){},
         icon: const Icon(Icons.person)),
            ), 
        
            const SizedBox(width: 20,), 
        
            // driver details
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14,), 
                Text('James Billy', style: TextStyle(color: Colors.black, fontSize: 16),),
                Text('Driver', style: TextStyle(color: Colors.grey, fontSize: 14),),
              ],
            ), 

            // Buttons. 
            const Spacer(), 
            Row(
            
              children: [
                // Message Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle, 
                  ),
                  child: IconButton(onPressed: (){}, 
                  icon: const Icon(Icons.message, size: 24,),),
                ), 
const SizedBox(width: 10,), 
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle, 
                  ),
                  child: IconButton(onPressed: (){}, 
                  icon: const Icon(Icons.call, color: Colors.green, size: 24,),),
                ),
              ],
            )
          ],
        ),
      
    ); 
  }
}