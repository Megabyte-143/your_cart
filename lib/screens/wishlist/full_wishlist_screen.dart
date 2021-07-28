import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';
import '../../wigets/full_wishlist_screen/items.dart';

class FullWishlistScreen extends StatelessWidget {
  const FullWishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
            appBar: AppBar(
              backgroundColor:
            themeChange.darkTheme ? Colors.grey.shade200 : Colors.black38,
        title: Text(
          'Wishlist()',
          style: TextStyle(
            color: themeChange.darkTheme ? Colors.black : Colors.grey.shade200,
          ),
        ),
            ),
            body: ListView.builder(
              itemBuilder: (ctx, i) => const FullWishlistScreenItems(),
              itemCount: 10,
            ),
          );
  }
}
