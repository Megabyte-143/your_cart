import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';

import '../../provider/dark_theme_provider.dart';

import '../../screens/feeds_screen.dart';

class EmptyWishlistScreen extends StatelessWidget {
  //const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: const Image(
              image: AssetImage('assets/images/empty-wishlist.png'),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Your Wishlist Is Empty',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Add Some Items',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: themeChange.darkTheme
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FeedsScreen.routeName);
              },
              color: Colors.purpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Explore The Feeds',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
