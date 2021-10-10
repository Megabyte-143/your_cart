import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

class ProductDetailScreenDoubleText extends StatelessWidget {
  const ProductDetailScreenDoubleText(
    this.text1,
    this.text2,
  );

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: darkTheme ? Colors.grey.shade300 : Colors.grey.shade900,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: darkTheme ? Colors.grey.shade600 : Colors.grey,
          ),
        ),
      ],
    );
  }
}
