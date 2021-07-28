import 'package:flutter/material.dart';

import 'empty_cart_screen.dart';
import 'full_cart_screen.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  static const routename = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final List cartItems = [];
    return !cartItems.isEmpty ? EmptyCartScreen() : const FullCartScreen();
  }
}
