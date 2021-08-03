import 'package:flutter/material.dart';

class Wishlist with ChangeNotifier {
  Wishlist({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  final String id;
  final String title;
  final double price;
  final String imageUrl;
}
