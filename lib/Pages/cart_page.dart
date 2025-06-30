import 'package:delivery/Extras/cart_tile.dart';
import 'package:delivery/Extras/sign_in_button.dart';
import 'package:delivery/Pages/pyment_page.dart';
import 'package:delivery/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        // scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Clear Cart ?'),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        // yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Column(
            children: [
              // list of carts
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                'Your Cart is Empty',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // get individual cart item
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                    // Text(userCart.length.toString()),
                  ],
                ),
              ),
              // Button to pay
              MyButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                ),
                text: "Go to check out",
              ),
              SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
