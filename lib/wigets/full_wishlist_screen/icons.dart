import 'package:flutter/material.dart';

class FullWishlistScreenIcon extends StatelessWidget {
  const FullWishlistScreenIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 28,
      top: 3,
      child: Material(
        color: Colors.red,
        child: InkWell(
          onTap: null,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
