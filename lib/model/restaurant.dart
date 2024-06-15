import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quick_bite/model/food.dart';

import 'cart_item.dart';

class Restaurant extends ChangeNotifier{

  // list of food menu

  final List<Food> _menu = [

// Burgers. 
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

Food(
  name: "Bacon Cheeseburger", 
  description: "A classic cheeseburger with crispy bacon added for extra flavor. Served on a toasted bun.", 
  image: "assets/products/burger/3.jpg",
   price: 0.28,
    category: FoodCategory.burgers, 
    availableAddons:[
      Addon(name: 'Extra Cheese', price: 0.99), 
      Addon(name: 'Lettuce', price: 0.99),
      Addon(name: 'Tomato', price: 0.99),
    ]
    ), 


Food(
  name: "Veggie Burger", 
  description: "A meatless patty made from vegetables, grains, and legumes, served with classic burger toppings.", 
  image: "assets/products/burger/4.jpg",
   price: 0.60,
    category: FoodCategory.burgers, 
    availableAddons:[
      Addon(name: 'Extra Cheese', price: 0.99), 
      Addon(name: 'Lettuce', price: 0.99),
      Addon(name: 'Tomato', price: 0.99),
    ]
    ), 

Food(
  name: "Chicken Burger", 
  description: "A ground chicken patty, often seasoned with herbs and spices, served with lettuce, tomato, and mayo.", 
  image: "assets/products/burger/5.jpg",
   price: 1.28,
    category: FoodCategory.burgers, 
    availableAddons:[
      Addon(name: 'Extra Cheese', price: 0.99), 
      Addon(name: 'Lettuce', price: 0.99),
      Addon(name: 'Tomato', price: 0.99),
    ]
    ), 

Food(
  name: "Italian Burger", 
  description: "A beef patty topped with marinara sauce, mozzarella cheese, and basil.", 
  image: "assets/products/burger/1.jpg",
   price: 0.62,
    category: FoodCategory.burgers, 
    availableAddons:[
      Addon(name: 'Extra Cheese', price: 0.99), 
      Addon(name: 'Lettuce', price: 0.99),
      Addon(name: 'Tomato', price: 0.99),
    ]
    ), 


// Salads.
Food(
  name: "Caesar Salad", 
  description: "Crisp romaine lettuce tossed with Caesar dressing, Parmesan cheese, and croutons. Often garnished with anchovies and topped with grilled chicken or shrimp for added protein.", 
  image: "assets/products/salad/1.jpg",
   price: 0.99,
    category: FoodCategory.salads, 
    availableAddons:[
      Addon(name: 'Grilled chicken', price: 0.99), 
      Addon(name: 'Sun-dried tomatoes', price: 0.99),
      Addon(name: 'Avocado slices', price: 0.99),
    ]
    ), 

    Food(
  name: "Greek Salad", 
  description: "A refreshing salad featuring chunks of cucumber, tomatoes, green bell peppers, red onions, Kalamata olives, and feta cheese, all dressed in olive oil, lemon juice, and oregano. Sometimes includes capers and fresh herbs like parsley.", 
  image: "assets/products/salad/2.jpg",
   price: 0.99,
    category: FoodCategory.salads, 
    availableAddons:[
      Addon(name: 'Grilled chicken', price: 0.99), 
      Addon(name: 'Artichoke hearts', price: 0.99),
      Addon(name: 'Pita bread croutons', price: 0.99),
    ]
    ), 

     Food(
  name: "Cobb Salad", 
  description: "A hearty salad made with mixed greens, rows of diced chicken, crispy bacon, hard-boiled eggs, avocado, tomatoes, blue cheese crumbles, and chives. Typically served with a red wine vinaigrette or ranch dressing.", 
  image: "assets/products/salad/3.jpg",
   price: 0.99,
    category: FoodCategory.salads, 
    availableAddons:[
      Addon(name: 'Roasted corn', price: 0.99), 
      Addon(name: 'Sliced radishes', price: 0.99),
      Addon(name: 'Pickled onions', price: 0.99),
    ]
    ), 

     Food(
  name: "Caprese Salad", 
  description: "A simple, elegant salad made with slices of ripe tomatoes, fresh mozzarella cheese, and basil leaves, drizzled with balsamic glaze and extra virgin olive oil. Often seasoned with salt and pepper.", 
  image: "assets/products/salad/4.jpg",
   price: 0.99,
    category: FoodCategory.salads, 
    availableAddons:[
      Addon(name: 'Prosciutto', price: 0.99), 
      Addon(name: 'Arugula', price: 0.99),
      Addon(name: 'Pine nuts', price: 0.99),
    ]
    ), 

     Food(
  name: "Nicoise Salad", 
  description: "A traditional French salad with a base of mixed greens topped with tuna (cooked or canned), hard-boiled eggs, Niçoise olives, green beans, tomatoes, and boiled potatoes. Dressed with a light vinaigrette made from olive oil, Dijon mustard, and red wine vinegar.", 
  image: "assets/products/salad/5.jpg",
   price: 0.99,
    category: FoodCategory.salads, 
    availableAddons:[
      Addon(name: 'Roasted red peppers', price: 0.99), 
      Addon(name: 'Capers', price: 0.99),
      Addon(name: 'Anchovies', price: 0.99),
    ]
    ), 


// Chicken
Food(
  name: "Chicken Parmesan", 
  description: "Breaded and fried chicken cutlets topped with marinara sauce and melted mozzarella and Parmesan cheese, typically served over pasta.", 
  image: "assets/products/chicken/1.jpg",
   price: 0.99,
    category: FoodCategory.chicken, 
    availableAddons:[
      Addon(name: 'Fresh basil leaves', price: 0.99), 
      Addon(name: 'Sautéed spinach', price: 0.99),
      Addon(name: 'Garlic bread', price: 0.99),
    ]
    ), 

    Food(
  name: "Chicken Alfredo", 
  description: "Grilled or sautéed chicken served over fettuccine pasta tossed in a creamy Alfredo sauce made from butter, cream, and Parmesan cheese", 
  image: "assets/products/chicken/2.jpg",
   price: 0.99,
    category: FoodCategory.chicken, 
    availableAddons:[
      Addon(name: 'Broccoli florets', price: 0.99), 
      Addon(name: 'Sun-dried tomatoes', price: 0.99),
      Addon(name: 'Mushrooms', price: 0.99),
    ]
    ), 

     Food(
  name: "Chicken Tikka Masala", 
  description: "Marinated pieces of chicken cooked in a rich and creamy tomato-based sauce with a blend of spices, often served with rice or naan bread.", 
  image: "assets/products/chicken/3.jpg",
   price: 0.99,
    category: FoodCategory.chicken, 
    availableAddons:[
      Addon(name: 'Fresh cilantro', price: 0.99), 
      Addon(name: 'Raita (yogurt sauce)', price: 0.99),
      Addon(name: 'Sliced almonds', price: 0.99),
    ]
    ), 

    
     Food(
  name: "Chicken Fajitas", 
  description: "Sliced chicken breast sautéed with bell peppers and onions, seasoned with a blend of spices, and served with tortillas, salsa, and guacamole.", 
  image: "assets/products/chicken/4.jpg",
   price: 0.99,
    category: FoodCategory.chicken, 
    availableAddons:[
      Addon(name: 'Shredded cheese', price: 0.99), 
      Addon(name: 'Sour cream', price: 0.99),
      Addon(name: 'Jalapeño slices', price: 0.99),
    ]
    ),

    
     Food(
  name: "Chicken Piccata", 
  description: "Pan-seared chicken cutlets in a lemon butter sauce with capers, often served with pasta or rice.", 
  image: "assets/products/chicken/5.jpg",
   price: 0.99,
    category: FoodCategory.chicken, 
    availableAddons:[
      Addon(name: 'Roasted asparagus', price: 0.99), 
      Addon(name: 'Cherry tomatoes', price: 0.99),
      Addon(name: 'Fresh parsley', price: 0.99),
    ]
    ),

    // Sandwish
     Food(
  name: "Club Sandwich", 
  description: "A triple-decker sandwich made with toasted bread, sliced turkey or chicken, bacon, lettuce, tomato, and mayonnaise. Often cut into quarters and held together with toothpicks.", 
  image: "assets/products/sandwish/1.jpg",
   price: 0.99,
    category: FoodCategory.sandwish, 
    availableAddons:[
      Addon(name: 'Avocado slices', price: 0.99), 
      Addon(name: 'Cheddar cheese', price: 0.99),
      Addon(name: 'Pickles', price: 0.99),
    ]
    ),

       Food(
  name: "BLT Sandwich", 
  description: "A classic sandwich made with crispy bacon, lettuce, and tomato, typically served on toasted bread with mayonnaise.", 
  image: "assets/products/sandwish/2.jpg",
   price: 0.99,
    category: FoodCategory.sandwish, 
    availableAddons:[
      Addon(name: 'Avocado', price: 0.99), 
      Addon(name: 'Sliced turkey', price: 0.99),
      Addon(name: 'Fried egg', price: 0.99),
    ]
    ),

      Food(
  name: "Caprese Sandwich", 
  description: "A fresh sandwich made with slices of ripe tomatoes, fresh mozzarella, and basil leaves, drizzled with balsamic glaze and olive oil, served on ciabatta or baguette..", 
  image: "assets/products/sandwish/3.jpg",
   price: 0.99,
    category: FoodCategory.sandwish, 
    availableAddons:[
      Addon(name: 'Prosciutto', price: 0.99), 
      Addon(name: 'Arugula', price: 0.99),
      Addon(name: 'Pesto', price: 0.99),
    ]
    ),

    // Dessert
       Food(
  name: "Chocolate Brownie", 
  description: "A rich, dense, and fudgy baked dessert made with chocolate, butter, sugar, and flour. Often enjoyed with a crisp top and a gooey center", 
  image: "assets/products/desserts/1.jpg",
   price: 0.99,
    category: FoodCategory.dessert, 
    availableAddons:[
      Addon(name: 'Vanilla ice cream', price: 0.99), 
      Addon(name: 'Caramel sauce', price: 0.99),
      Addon(name: 'Chopped nuts', price: 0.99),
    ]
    ),

  Food(
  name: "Apple Pie", 
  description: "A classic dessert featuring a buttery, flaky crust filled with sweet and spiced apple slices, baked until golden and bubbly.", 
  image: "assets/products/desserts/2.jpg",
   price: 0.99,
    category: FoodCategory.dessert, 
    availableAddons:[
      Addon(name: 'Vanilla ice cream', price: 0.99), 
      Addon(name: 'Caramel sauce', price: 0.99),
      Addon(name: 'Crushed pecans', price: 0.99),
    ]
    ),

    Food(
  name: "Panna Cotta", 
  description: "A creamy Italian dessert made from sweetened cream thickened with gelatin and flavored with vanilla, often served chilled.", 
  image: "assets/products/desserts/3.jpg",
   price: 0.99,
    category: FoodCategory.dessert, 
    availableAddons:[
      Addon(name: 'Berry compote', price: 0.99), 
      Addon(name: 'Fresh mint leaves', price: 0.99),
      Addon(name: 'Honey drizzle', price: 0.99),
    ]
    ),

     Food(
  name: "Cheesecake", 
  description: "A creamy, smooth dessert with a graham cracker crust and a rich filling made from cream cheese, eggs, and sugar. It can be baked or no-bake.", 
  image: "assets/products/desserts/4.jpg",
   price: 0.99,
    category: FoodCategory.dessert, 
    availableAddons:[
      Addon(name: 'Fresh berries', price: 0.99), 
      Addon(name: 'Chocolate ganache', price: 0.99),
      Addon(name: 'Whipped cream', price: 0.99),
    ]
    ),

    // Drinks
    Food(
  name: "Coke", 
  description: "Coca-Cola, commonly referred to as Coke, is a classic carbonated soft drink with a unique, refreshing taste. It features a blend of caramel, vanilla, and a hint of citrus, with a crisp, effervescent finish.", 
  image: "assets/products/drink/1.jpg",
   price: 0.99,
    category: FoodCategory.drinks, 
    availableAddons:[
      Addon(name: 'Lemon wedges', price: 0.99), 
      Addon(name: 'Scoop of vanilla', price: 0.99),
      Addon(name: 'Grenadine', price: 0.99),
    ]
    ),

    Food(
  name: "Fanta", 
  description: "Fanta is a fruity, carbonated soft drink available in various flavors, with the most popular being Orange. It is known for its bright, sweet, and tangy flavor profile, delivering a refreshing and vibrant taste.", 
  image: "assets/products/drink/2.jpg",
   price: 0.99,
    category: FoodCategory.drinks, 
    availableAddons:[
      Addon(name: 'Orange slices', price: 0.99), 
      Addon(name: 'Orange sherbet', price: 0.99),
      Addon(name: 'Pineapple juice', price: 0.99),
    ]
    ),

       Food(
  name: "Hype Energy", 
  description: "Hype Energy is a popular energy drink designed to boost energy and alertness. It typically features a mix of caffeine, taurine, vitamins, and a fruity, slightly sweet flavor, often with a hint of citrus.", 
  image: "assets/products/drink/3.jpg",
   price: 0.99,
    category: FoodCategory.drinks, 
    availableAddons:[
      Addon(name: 'Fresh mint leaves', price: 0.99), 
      Addon(name: 'lime juice', price: 0.99),
      Addon(name: 'Crushed ice', price: 0.99),
    ]
    ),
  ]; 

// 0. User Cart
final List<CartItem> _cart = [];

// delivery address which user can change or update. 
String _deliveryAddress = "123 Main Street, Anytown, USA";

  // GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // OPERATIONS


  // 1. add to cart
  void addToCart(Food food, List<Addon> selectedAddons){
    // see if there is a cart item already with the same food and selected addons. 

    // Cartitem? cartItem = cartItems.firstWhereOrNull((cartItem) => cartItem.food == food && cartItem.selectedAddons == selectedAddons);


    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same. 
bool isSameFood = item.food == food;


      // check if the list of selected addons are the same. 

      bool isSameAddons = 
      const ListEquality().equals(item.selectedAddons, selectedAddons); 

      return isSameFood && isSameAddons; 
    }); 

    // if item already exists, increment quantity
    if(cartItem != null){
      cartItem.quantity++; 
    }

    // otherwise, add a new cart item to the cart. 
    else {
      _cart.add(
        CartItem(
          food: food,
           selectedAddons: selectedAddons,
           // quantity: 1
            )
            );
    }
    notifyListeners(); 
  }

  
  // 2. remove from cart

// void removeFromCart(CartItem cartItem){
//   _cart.remove(cartItem);
//   notifyListeners();
// }

void removeFromCart(CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem); 

  if (cartIndex != -1) {
    if(_cart[cartIndex].quantity > 1){
      _cart[cartIndex].quantity--;
    }
    else{
      _cart.removeAt(cartIndex);
    }
  }

  notifyListeners();
}

  // 3. get total price of cart. 

  double getTotalPrice(){
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price; 

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price; 
      }

      total +=itemTotal*cartItem.quantity;
    }

    return total;
  }

  // 4. total number of items in cart. 
  int getTotalItemCount() {
    int totalItemCount = 0; 

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity; 
    }

    return totalItemCount; 
  }


  // 5. clear the cart. 

  void clearCart(){
    _cart.clear(); 
    notifyListeners(); 
  }


// to update delivery address. 

void updateDeliveryAddress(String newAddress){
  _deliveryAddress = newAddress;
  notifyListeners();}
  // HELPERS

  // 1. generate a receipt
String displayCartReceipt(){
final receipt = StringBuffer(); 
receipt.writeln('Here is your receipt');
receipt.writeln(); 

// format the date to include up to seconds only
String formattedDate = DateFormat('yyyy-MM-dd – HH:mm:ss').format(DateTime.now());
receipt.writeln(formattedDate);
receipt.writeln(); 
receipt.writeln('---------------------------------');

for (final cartItem in _cart) {
  receipt.writeln(
    '${cartItem.quantity} * ${cartItem.food.name} -  ${_formatPrice(cartItem.food.price)}'
  );
  if (cartItem.selectedAddons.isNotEmpty) {
    receipt.writeln(' Add-ons: ${_formatAddons(cartItem.selectedAddons)}');
  }
  receipt.writeln(); 
}

receipt.writeln('---------------------------------');
receipt.writeln();
receipt.writeln('Total Items: ${getTotalItemCount()}');
receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');
receipt.writeln(); 
receipt.writeln('Delivery to: $deliveryAddress'); 
return receipt.toString(); 

}

  // 2. format double value into money

  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }
  // 3. format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
    .map((addon) => '${addon.name}(${_formatPrice(addon.price)})').join(', ');
  }
}