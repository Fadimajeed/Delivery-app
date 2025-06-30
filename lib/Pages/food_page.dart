import 'package:delivery/Extras/sign_in_button.dart';
import 'package:delivery/model/food.dart';
import 'package:delivery/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<Addon, bool> selectedAddons;

  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // close the current food page to go back to menu
    Navigator.pop(context);

    // format the selected addons
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.avilableAddons) {
      if (selectedAddons[addon] == true) {
        currentSelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }

  @override
  void initState() {
    super.initState();
    selectedAddons = {
      for (var addon in widget.food.avilableAddons) addon: false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    // food image
                    Image.asset(widget.food.imagePath),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // food name
                          Text(
                            widget.food.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // food price
                          Text(
                            "\$ ${widget.food.price}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(height: 10),
                          // food description
                          Text(
                            widget.food.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          SizedBox(height: 10),
                          // addons
                          Text(
                            "Add-ons",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(
                                context,
                              ).colorScheme.inversePrimary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListView.builder(
                              itemCount: widget.food.avilableAddons.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // get individual addon
                                Addon addon = widget.food.avilableAddons[index];
                                // return check box tile UI
                                return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text(
                                    "\$ ${addon.price}",
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                  value: selectedAddons[addon],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      selectedAddons[addon] = value!;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // add to cart button
                  ],
                ),
                MyButton(
                  onTap: () => addToCart(widget.food, selectedAddons),
                  text: "Add to Cart",
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
        // back button on top of the image
        SafeArea(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
