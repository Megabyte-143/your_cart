import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/dark_theme_provider.dart';

class HomeScreenPopularProductsText extends StatelessWidget {
  const HomeScreenPopularProductsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Popular Products",
        style: TextStyle(
          color: darkTheme ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
