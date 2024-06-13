import 'package:quick_bite/model/food.dart';

class Restaurant {

  // list of food menu

  final List<Food> _menu = [


Food(
  name: "Classic Cheeseburger", 
  description: "A juicy beef patty topped with melted cheese, lettuce, tomato, onions, pickles, ketchup, and mustard on a toasted bun.", 
  image: "assets/products/burger/2.jpg",
   price: 0.99,
    category: FoodCategory.burgers, 
    availableAddons:[
      Addon(name: 'Extra Cheese', price: 0.99), 
      Addon(name: 'Lettuce', price: 0.99),
      Addon(name: 'Tomato', price: 0.99),
    ]
    ), 

  ]; 
}