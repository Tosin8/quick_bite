// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:QuickBite/components/form/app_button.dart';
import 'package:QuickBite/screens/fav_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../model/food.dart';
import '../../model/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food; 
  final Map<Addon, bool> selectedAddons = {};
   FoodPage({
    super.key,
    required this.food,
  }){
    //  initialize selected addons to be false.
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  // method to add to cart
  void addToCart(Food food, Map <Addon, bool> selectedAddons) {
    // close teh current food page to go back to menu
    Navigator.pop(context);

    // format the selected addons.
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
         Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              
        Hero(
          tag: widget.food.image, 
          child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.food.image),
            fit: BoxFit.cover,
          ),
                ),
                child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent,
              Colors.black12, 
               Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
                ),
          ),
        ), 

              // food name
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.food.name, 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        
                      //  const Icon(Icons.favorite_border_outlined,
                      //     size: 30,), 
 IconButton(
  icon: Icon(
    widget.food.isFavorite ? Icons.favorite : Icons.favorite_border,
    color: widget.food.isFavorite ? Colors.red : Colors.grey,
  ),
  onPressed: () {
    Provider.of<FavoriteProvider>(context, listen: false)
        .toggleFavorite(widget.food);
  // Show a Scaffold message
                              final snackBar = SnackBar(
                                
                           
                                
                                content: Text(
                                  '${widget.food.name} has been added to your favorites.',
                                ),
                                duration: const Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
        
  },
)


                      ],
                    ),
                
        const SizedBox(height: 10,), 
                // food price 
                Text('\$${widget.food.price}',
                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),), 
                const SizedBox(height: 8,), 
                      // food description
                Text(widget.food.description, 
                style: const TextStyle(color: Colors.black, fontSize: 14),), 
                
                const SizedBox(height: 10,),
                const Divider(color: Colors.white, thickness: 2,), 
                const SizedBox(height: 10,),
                const Text('Add-ons',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),), 
                
                // addons. 
                
                    ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context, index){
                
                    //get individual addon
                    Addon addon = widget.food.availableAddons[index];
                    return CheckboxListTile(
                      title: Text(addon.name),
                      subtitle: Text('\$${addon.price}'),
                      value: widget.selectedAddons[addon], 
                      onChanged: (bool? value){
                        setState(() {
                          widget.selectedAddons[addon] = value!;
                        });
                      }); 
                  })
                  ],
                ),
              ), 
        
            
        // add to cart button
        AppButton(
          text: 'Add to cart', 
        //onTap: () => addToCart(widget.food, widget.selectedAddons),
        onTap: (){
          
          addToCart(widget.food, widget.selectedAddons); 
        }
        ), 
        const SizedBox(height: 30,), 
          
            ],
          ),
      ),
      ),
// appBar: AppBar(
      //   leading: IconButton(onPressed: () => Navigator.pop(context), 
      //   icon: Icon(Icons.arrow_back_ios)), 
      // ),
      SafeArea(
        child: Opacity( 
          opacity: 0.7,
          child: Container(
            height: 50,width: 50,
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(7), 
            decoration: const BoxDecoration(
              color: Colors.white, 
           
            shape: BoxShape.circle),
            child: IconButton(onPressed: () => Navigator.pop(context),
             icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
      )
   ] );
  }
}

// FOR BACKEND.

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quick_bite/components/form/app_button.dart';
// import '../../model/food.dart';
// import '../../model/restaurant.dart';

// class FoodPage extends StatefulWidget {
//   final Food food;
//   final Map<Addon, bool> selectedAddons = {};
  
//   FoodPage({
//     super.key,
//     required this.food,
//   }) {
//     for (Addon addon in food.availableAddons) {
//       selectedAddons[addon] = false;
//     }
//   }

//   @override
//   State<FoodPage> createState() => _FoodPageState();
// }

// class _FoodPageState extends State<FoodPage> {

//   void addToCart(Food food, Map<Addon, bool> selectedAddons) {
//     Navigator.pop(context);
//     List<Addon> currentlySelectedAddons = [];
//     for (Addon addon in widget.food.availableAddons) {
//       if (widget.selectedAddons[addon] == true) {
//         currentlySelectedAddons.add(addon);
//       }
//     }
//     context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Hero(
//                 tag: widget.food.image,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 350,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(widget.food.image),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.transparent, Colors.black12, Colors.black],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           widget.food.name,
//                           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         Icon(Icons.favorite_border_outlined, size: 30),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       '\$${widget.food.price}',
//                       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       widget.food.description,
//                       style: const TextStyle(color: Colors.black, fontSize: 14),
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(color: Colors.white, thickness: 2),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Add-ons',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     const SizedBox(height: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: widget.food.availableAddons.map((addon) {
//                         return CheckboxListTile(
//                           contentPadding: EdgeInsets.zero,
//                           controlAffinity: ListTileControlAffinity.leading,
//                           title: Text(addon.name),
//                           value: widget.selectedAddons[addon],
//                           onChanged: (value) {
//                             setState(() {
//                               widget.selectedAddons[addon] = value ?? false;
//                             });
//                           },
//                         );
//                       }).toList(),
//                     ),
//                     const SizedBox(height: 100),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: 0,
//         left: 0,
//         right: 0,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: AppButton(
//             onTap: () => addToCart(widget.food, widget.selectedAddons),
           
//             text: 'Add to Cart',
//           ),
//         ),
//       )
//     ]);
//   }
// }

