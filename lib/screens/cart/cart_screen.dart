import 'package:flutter/material.dart';
import 'package:your_cart/screens/cart/empty_cart_screen.dart';

import 'empty_cart_screen.dart';
import 'full_cart.dart';

class CartScreen extends StatelessWidget {
 // const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List cartItems = [];
    return  Scaffold(
      body: cartItems.isEmpty? EmptyCartScreen(): const FullCartScreen(),
    );
  }
}
