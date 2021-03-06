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
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
