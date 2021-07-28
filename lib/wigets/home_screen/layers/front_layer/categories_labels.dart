import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/dark_theme_provider.dart';

class HomeScreenCategoriesLabels extends StatelessWidget {
  const HomeScreenCategoriesLabels({
    Key? key,
    required List<Map<String, Object>> categories,
    required this.index,
  })  : _categories = categories,
        super(key: key);

  final List<Map<String, Object>> _categories;
  final int index;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Positioned(
      bottom: 0,
      left: 10,
      right: 10,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        color: darkTheme ? Colors.black38 : Colors.white24,
        child: Text(
          _categories[index]['category'].toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
