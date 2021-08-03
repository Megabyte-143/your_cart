import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../../provider/dark_theme_provider.dart';

class FullWishlistScreenText extends StatelessWidget {
  const FullWishlistScreenText({
    required this.title,
    required this.price,
  });
  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Text(
                '$price',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: themeChange.darkTheme
                      ? Colors.yellow
                      : ColorsConsts.purple800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
