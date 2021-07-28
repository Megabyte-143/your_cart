import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/dark_theme_provider.dart';

class HomeScreenCategoriesText extends StatelessWidget {
  const HomeScreenCategoriesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Categories",
        style: TextStyle(
          color: darkTheme ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
