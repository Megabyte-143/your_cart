import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetailScreenAppBarIcons extends StatelessWidget {
  //const ProductDetailScreenIcons({Key? key}) : super(key: key);

  const ProductDetailScreenAppBarIcons(
    this.icon,
    this.onTap,
    this.color,
    this.quantity,
  );
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Badge(
      animationType: BadgeAnimationType.slide, alignment: Alignment.topRight,
      shape: BadgeShape.circle,
      toAnimate: true,
      badgeColor: Colors.redAccent,
      elevation: 3,
      //position: BadgePosition.topEnd(top: 0, end: 0),
      badgeContent: Text(
        '$quantity',
        textAlign: TextAlign.center,
      ),
      child: InkWell(
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
