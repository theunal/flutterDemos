import 'package:bloc_demo/screens/cart_screen.dart';
import 'package:bloc_demo/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => ProductListScreen(),
        '/cart': (context) => CartScreen(),
      },
      initialRoute: '/',
    );
  }
}
