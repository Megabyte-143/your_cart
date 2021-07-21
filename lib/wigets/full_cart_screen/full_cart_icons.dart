import 'package:flutter/material.dart';

class FullCartIcons extends StatelessWidget {
  //const FullCartIcons({Key? key}) : super(key: key);

  const FullCartIcons({
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.backIconColor,
  });

  final Function onTap;
  final IconData icon;
  final Color iconColor;
  final Color backIconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backIconColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: () {
          onTap();
        },
        child: Container(
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}
