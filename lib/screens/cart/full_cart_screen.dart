import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

import '../../wigets/full_cart_screen/bottom_sheet.dart' as bottom_sheet;
import '../../wigets/full_cart_screen/full_cart_icons.dart';
import '../../wigets/full_cart_screen/full_cart_items.dart';

class FullCartScreen extends StatefulWidget {
  const FullCartScreen({Key? key}) : super(key: key);

  @override
  _FullCartScreenState createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeChange.darkTheme ? Colors.grey.shade200 : Colors.black,
        title: Text(
          'Your Cart',
          style: TextStyle(
            color: themeChange.darkTheme ? Colors.black : Colors.grey.shade200,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: FullCartIcons(
              onTap: () {
                print("App Bar Icon");
              },
              icon: Icons.shopping_bag,
              iconColor: themeChange.darkTheme ? Colors.black : Colors.white,
              backIconColor: Colors.transparent,
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(bottom: 60),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (ctx, i) {
              return const FullCartItems();
            }),
      ),
      bottomSheet: bottom_sheet.BottomSheet(),
    );
  }
}
