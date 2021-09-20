import 'package:flutter/material.dart';

class FullWishlistScreenImage extends StatelessWidget {
  const FullWishlistScreenImage({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.contain,
        ),
        boxShadow: [BoxShadow(offset: Offset.fromDirection(2, 1))],
      ),
    );
  }
}
