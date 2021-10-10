import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';
import '../../provider/dark_theme_provider.dart';

import '../../widgets/alert_dialog.dart';
import '../../widgets/full_cart_screen/bottom_sheet.dart' as bottom_sheet;
import '../../widgets/full_cart_screen/full_cart_icons.dart';
import '../../widgets/full_cart_screen/full_cart_items.dart';

class FullCartScreen extends StatefulWidget {
  const FullCartScreen({Key? key, required this.cartListLength})
      : super(key: key);
  final int cartListLength;
  @override
  _FullCartScreenState createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  @override
  Widget build(BuildContext context) {
    final _cartList = Provider.of<CartProvider>(context, listen: false);
    final cartList = _cartList.cartList.values.toList();
    final AlertDialogMethod alertDialog = AlertDialogMethod();
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeChange.darkTheme ? Colors.grey.shade200 : Colors.black38,
        title: Text(
          'Your Cart (${cartList.length})',
          style: TextStyle(
            color: themeChange.darkTheme ? Colors.black : Colors.grey.shade200,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: FullCartIcons(
              onTap: () {
                print("App Bar Icon");
                alertDialog.showDialogMethod(
                  'Clear the Cart?',
                  'Are you Sure?',
                  () => _cartList.clearCart(),
                  context,
                );
              },
              icon: Icons.delete_outline,
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
          itemCount: cartList.length,
          itemBuilder: (ctx, i) {
            return ChangeNotifierProvider.value(
              value: cartList[i],
              child: FullCartItems(
                productId: _cartList.cartList.keys.toList()[i],
                // imageUrl: cartList[i].imageUrl,
                // title: cartList[i].title,
                // price: cartList[i].price,
                // quantity: cartList[i].quantity,
              ),
            );
          },
        ),
      ),
      bottomSheet: bottom_sheet.BottomSheet(
        totalAmt: _cartList.totalAmt,
      ),
    );
  }
}
