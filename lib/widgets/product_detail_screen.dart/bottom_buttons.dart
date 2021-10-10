import 'package:flutter/material.dart';

class ProductDetailScreenBottomBarButton extends StatelessWidget {
  //const ProductDetailScreenBottomButton({Key? key}) : super(key: key);

  const ProductDetailScreenBottomBarButton(
    this.icon,
    this.onTap,
    this.text,
    this.color,
  );

  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: color),
          alignment: Alignment.center,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
