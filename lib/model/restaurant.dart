// import 'package:flutter/material.dart';
import 'package:delivery/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Cheeseburger",
      description:
          "A classic cheeseburger with a juicy patty, melted cheese, fresh lettuce, tomato, and pickles.",
      imagePath: "lib/Images/Burgers/cheeseburger.png",
      price: 8.99,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Bacon", price: 1.50),
        Addon(name: "Extra Cheese", price: 0.75),
      ],
    ),
    Food(
      name: "Hamburger",
      description:
          "A classic hamburger with a juicy patty, fresh lettuce, tomato, and pickles.",
      imagePath: "lib/Images/Burgers/hamburger.png",
      price: 7.99,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Bacon", price: 1.50),
        Addon(name: "Grilled Onions", price: 0.50),
      ],
    ),
    Food(
      name: "Double Cheeseburger",
      description:
          "Two juicy patties, double the melted cheese, fresh lettuce, tomato, and pickles.",
      imagePath: "lib/Images/Burgers/double_cheeseburger.png",
      price: 11.99,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Bacon", price: 1.50),
        Addon(name: "Extra Patty", price: 2.00),
      ],
    ),
    Food(
      name: "Vegan Burger",
      description:
          "A delicious plant-based patty with fresh lettuce, tomato, pickles, and a vegan bun.",
      imagePath: "lib/Images/Burgers/vegan_burger.png",
      price: 9.99,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Vegan Cheese", price: 1.00),
        Addon(name: "Avocado", price: 1.50),
      ],
    ),
    Food(
      name: "BBQ Burger",
      description:
          "A savory burger topped with crispy onion rings, smoky bacon, and tangy BBQ sauce.",
      imagePath: "lib/Images/Burgers/bbq_burger.png",
      price: 10.50,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Extra BBQ Sauce", price: 0.50),
        Addon(name: "Jalapenos", price: 0.75),
      ],
    ),
    Food(
      name: "Mushroom Swiss Burger",
      description:
          "A juicy patty topped with sautéed mushrooms and melted Swiss cheese.",
      imagePath: "lib/Images/Burgers/mushroom_swiss_burger.png",
      price: 9.50,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Caramelized Onions", price: 0.75),
        Addon(name: "Garlic Aioli", price: 0.50),
      ],
    ),
    Food(
      name: "Bacon Cheeseburger",
      description: "A classic cheeseburger elevated with crispy bacon.",
      imagePath: "lib/Images/Burgers/bacon_cheeseburger.png",
      price: 9.99,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Fried Egg", price: 1.50),
        Addon(name: "Avocado", price: 1.50),
      ],
    ),
    Food(
      name: "Chicken Burger",
      description:
          "Crispy fried chicken patty with fresh lettuce, tomato, and mayonnaise.",
      imagePath: "lib/Images/Burgers/chicken_burger.png",
      price: 8.99,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Spicy Mayo", price: 0.50),
        Addon(name: "Pickles", price: 0.25),
      ],
    ),
    Food(
      name: "Fish Burger",
      description:
          "Golden fried fish patty with tartar sauce and fresh lettuce.",
      imagePath: "lib/Images/Burgers/fish_burger.png",
      price: 8.50,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addon(name: "Cheese", price: 0.75),
        Addon(name: "Coleslaw", price: 1.00),
      ],
    ),

    // Salads
    Food(
      name: "Garden Salad",
      description:
          "Fresh mixed greens with cherry tomatoes, cucumbers, and carrots.",
      imagePath: "lib/Images/Salads/garden_salad.png",
      price: 6.99,
      category: FoodCategory.salads,
      avilableAddons: [
        Addon(name: "Grilled Chicken", price: 3.00),
        Addon(name: "Ranch Dressing", price: 0.50),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce, parmesan cheese, croutons, and Caesar dressing.",
      imagePath: "lib/Images/Salads/caesar_salad.png",
      price: 7.50,
      category: FoodCategory.salads,
      avilableAddons: [
        Addon(name: "Grilled Shrimp", price: 4.00),
        Addon(name: "Extra Dressing", price: 0.50),
      ],
    ),
    Food(
      name: "Fruit Salad",
      description: "A refreshing mix of seasonal fruits.",
      imagePath: "lib/Images/Salads/fruit_salad.png",
      price: 5.99,
      category: FoodCategory.salads,
      avilableAddons: [Addon(name: "Yogurt", price: 1.00)],
    ),

    // Sides
    Food(
      name: "French Fries",
      description: "Crispy golden French fries, perfectly salted.",
      imagePath: "lib/Images/Sides/french_fries.png",
      price: 3.50,
      category: FoodCategory.sides,
      avilableAddons: [
        Addon(name: "Cheese Sauce", price: 1.00),
        Addon(name: "Chili", price: 1.50),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Sweet onion rings, battered and fried to perfection.",
      imagePath: "lib/Images/Sides/onion_rings.png",
      price: 4.00,
      category: FoodCategory.sides,
      avilableAddons: [Addon(name: "Ranch Dip", price: 0.75)],
    ),
    Food(
      name: "Sweet Potato Fries",
      description: "Deliciously sweet and crispy sweet potato fries.",
      imagePath: "lib/Images/Sides/sweet_potato_fries.png",
      price: 4.50,
      category: FoodCategory.sides,
      avilableAddons: [Addon(name: "Maple Aioli", price: 0.75)],
    ),
    Food(
      name: "Mozzarella Sticks",
      description:
          "Golden fried mozzarella sticks with a side of marinara sauce.",
      imagePath: "lib/Images/Sides/mozzarella_sticks.png",
      price: 5.00,
      category: FoodCategory.sides,
      avilableAddons: [Addon(name: "Extra Marinara", price: 0.50)],
    ),

    // Desserts
    Food(
      name: "Chocolate Cake",
      description: "Rich and decadent chocolate cake.",
      imagePath: "lib/Images/Desserts/chocolate_cake.png",
      price: 6.00,
      category: FoodCategory.desserts,
      avilableAddons: [Addon(name: "Ice Cream Scoop", price: 1.50)],
    ),
    Food(
      name: "Ice Cream Cone",
      description: "A classic ice cream cone with your choice of flavor.",
      imagePath: "lib/Images/Desserts/ice_cream_cone.png",
      price: 3.00,
      category: FoodCategory.desserts,
      avilableAddons: [
        Addon(name: "Sprinkles", price: 0.25),
        Addon(name: "Chocolate Syrup", price: 0.50),
      ],
    ),
    Food(
      name: "Donut",
      description: "Freshly baked donut with sweet frosting.",
      imagePath: "lib/Images/Desserts/donut.png",
      price: 2.50,
      category: FoodCategory.desserts,
      avilableAddons: [Addon(name: "Extra Sprinkles", price: 0.25)],
    ),
    Food(
      name: "Chocolate Chip Cookie",
      description: "Warm and chewy chocolate chip cookie.",
      imagePath: "lib/Images/Desserts/chocolate_chip_cookie.png",
      price: 2.00,
      category: FoodCategory.desserts,
      avilableAddons: [Addon(name: "Warm Up", price: 0.25)],
    ),

    // Drinks
    Food(
      name: "Soda",
      description: "Your choice of refreshing soda.",
      imagePath: "lib/Images/Drinks/soda.png",
      price: 2.50,
      category: FoodCategory.drinks,
      avilableAddons: [Addon(name: "Large Size", price: 1.00)],
    ),
    Food(
      name: "Milkshake",
      description: "Creamy and delicious milkshake.",
      imagePath: "lib/Images/Drinks/milkshake.png",
      price: 5.00,
      category: FoodCategory.drinks,
      avilableAddons: [
        Addon(name: "Whipped Cream", price: 0.50),
        Addon(name: "Cherry", price: 0.25),
      ],
    ),
    Food(
      name: "Coffee",
      description: "Freshly brewed hot coffee.",
      imagePath: "lib/Images/Drinks/coffee.png",
      price: 3.00,
      category: FoodCategory.drinks,
      avilableAddons: [
        Addon(name: "Sugar", price: 0.00),
        Addon(name: "Cream", price: 0.00),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];
  // delivery address
  String? _deliveryAddress = "dummy location";

  //////////////////////////////Getters

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String? get deliveryAddress => _deliveryAddress;

  ////////////////////////////operations

  // add to the cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a care item alrady with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });
    // if itme aleardy exists, increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise, add a new cart item
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons, quantity: 1),
      );
    }
    notifyListeners();
  }

  // remove from the cart
  void removeFromCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
      } else {
        _cart.remove(cartItem);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double totalPrice = 0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      totalPrice += itemTotal * cartItem.quantity;
    }
    return totalPrice;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int itemCount = 0;
    for (CartItem cartItem in _cart) {
      itemCount += cartItem.quantity;
    }
    return itemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String address) {
    _deliveryAddress = address;
    notifyListeners();
  }

  //////////////////////////////Helper
  //generate a receipt
  String displayReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt:");
    receipt.writeln(
      "-------------------------------------------------------------------------",
    );
    // format the date to include up tp sconds only
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());
    receipt.writeln("Date: $formattedDate");
    receipt.writeln();
    receipt.writeln("------------");
    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }

      receipt.writeln("------------");
      receipt.writeln();
      receipt.write("Total Items: ${getTotalItemCount()}");
      receipt.writeln();
      receipt.write("Total price: ${_formatPrice(getTotalPrice())}");
      receipt.writeln();
      receipt.writeln("------------");
      receipt.writeln("Your address: $_deliveryAddress");
    }
    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(', ');
  }
}


