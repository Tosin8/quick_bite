class Food {
  final String name; 
  final String description; 
  final String image;
  final double price; 
  // final String category;

  Food({required this.name, required this.description, required this.image, required this.price, 
  //required this.category
});
}

// Enum: a short form of enumerated type , a set of named constants where all possible values are declared. 

// food categories

enum FoodCategory{
  burgers, 
  salads, 
  pizza,
  pasta, 
  dessert, 
  drinks, 
}