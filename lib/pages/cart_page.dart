import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/pages/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<CartModel>(
          builder: (context, cart, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Let's order fresh items for you",
                      style: GoogleFonts.notoSerif(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(cart.cartItems[index][0]),
                            subtitle: Text("SR${cart.cartItems[index][1]}"),
                            leading: Image.asset(cart.cartItems[index][2]),
                            trailing: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                cart.removeItem(index);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Total price
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 40, left: 35, right: 35),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("The total price",
                                style: TextStyle(color: Colors.white)),
                            const SizedBox(height: 4),
                            Text("SR${cart.calculateTotal()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            children: [
                              Text("Pay Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 5),
                              Icon(Icons.payment, color: Colors.white),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
