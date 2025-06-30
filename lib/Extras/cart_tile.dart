import 'package:delivery/Extras/quantity_selector.dart';
import 'package:delivery/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/restaurant.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  // food image
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  // name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name),
                      Text(
                        "\$ " + cartItem.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  // increment and decrement quantity button
                  QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncrement: () {
                      restaurant.addToCart(
                        cartItem.food,
                        cartItem.selectedAddons,
                      );
                    },

                    onDecrement: () {
                      restaurant.removeFromCart(
                        cartItem.food,
                        cartItem.selectedAddons,
                      );
                    },
                  ),
                ],
              ),
            ),
            // addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              // addon name
                              Text(addon.name),
                              // addon price
                              Text(" \$" + addon.price.toString(), style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                            ],
                          ),
                          onSelected:
                              (value){}, 
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                              ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
