import 'package:flutter/material.dart';
import 'package:grocery_shop/pages/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:grocery_shop/pages/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false, // Remove the debug banner
        home: IntroPage(),
      ),
    );
  }
}
