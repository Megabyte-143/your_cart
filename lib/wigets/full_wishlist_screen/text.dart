import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../../provider/dark_theme_provider.dart';

class FullWishlistScreenText extends StatelessWidget {
  const FullWishlistScreenText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
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
              'Title',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
            ),
            SizedBox(
              height: 20,
            ),
            Container(margin: EdgeInsets.only(left: 30),
              child: Text(
                'Price',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: themeChange.darkTheme
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
