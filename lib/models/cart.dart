import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Cart({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;
}
