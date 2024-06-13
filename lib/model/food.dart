// ignore_for_file: public_member_api_docs, sort_constructors_first
class Food {
  final String name; 
  final String description; 
  final String image;
  final double price; 
  final FoodCategory category;
  List <Addon> availableAddons; 

  Food({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// Enum: a short form of enumerated type , a set of named constants where all possible values are declared. 

// food categories

enum FoodCategory{
  burgers, 
  salads, 
  chicken,
  sandwish, 
  dessert, 
  drinks, 
}

// food addons
class Addon {
  String name; 
  double price; 
  Addon({
    required this.name,
    required this.price,
  });
}
