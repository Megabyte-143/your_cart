import 'package:flutter/material.dart';

class FullWishlistScreenIcon extends StatelessWidget {
  const FullWishlistScreenIcon({Key? key, required this.onTap})
      : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 28,
      top: 3,
      child: Material(
        color: Colors.red,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
