import 'package:flutter/material.dart';

import './empty_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyCartScreen(),
    );
  }
}
