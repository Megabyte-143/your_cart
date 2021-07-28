import 'package:flutter/material.dart';

class ProductDetailScreenIcons extends StatelessWidget {
  //const ProductDetailScreenIcons({Key? key}) : super(key: key);

  const ProductDetailScreenIcons(
    this.icon,
    this.onTap,
    this.color,
  );
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
