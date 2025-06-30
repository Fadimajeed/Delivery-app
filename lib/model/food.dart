class Food {
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final FoodCategory category;
  List<Addon> avilableAddons; 
  Food({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.category,
    required this.avilableAddons,
  });
}

// categorys
enum FoodCategory { burgers, salads, sides, desserts, drinks }

class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});
}
