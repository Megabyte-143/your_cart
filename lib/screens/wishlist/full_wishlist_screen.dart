import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';
import '../../provider/wishlist_provider.dart';

import '../../widgets/alert_dialog.dart';
import '../../widgets/full_wishlist_screen/items.dart';

class FullWishlistScreen extends StatelessWidget {
  const FullWishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<WishlistProvider>(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final AlertDialogMethod alertDialog = AlertDialogMethod();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeChange.darkTheme ? Colors.grey.shade400 : Colors.black38,
        title: Text(
          'Wishlist',
          style: TextStyle(
            color: themeChange.darkTheme ? Colors.black : Colors.grey.shade200,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: InkWell(
              onTap: () {
                alertDialog.showDialogMethod(
                  'Remove it from Wishlist',
                  'Are you Sure?',
                  wishList.clearWish,
                  context,
                );
              },
              child: const Material(
                color: Colors.transparent,
                child: Icon(
                  Icons.delete_outline,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: wishList.favsList.values.toList()[i],
          child: FullWishlistScreenItems(
            productId: wishList.favsList.keys.toList()[i],
          ),
        ),
        itemCount: wishList.favsList.length,
      ),
    );
  }
}
