import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", 4.99, "images/avocado.png", Colors.green],
    ["Banana", 7.26, "images/banana.png", Colors.yellow],
    ["Bread", 1.50, "images/bread.png", Colors.orange],
    ["Water", 1.00, "images/water.png", Colors.blue],
    ["Strawberry", 3.99, "images/strawberry.png", Colors.pink],
    ["Chocolate", 2.50, "images/chocolate.png", Colors.brown],
  ];

  final List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // Add addItem and removeItem methods
  void addItem(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1].toString());
    }
    return total.toStringAsFixed(2);
  }
}
