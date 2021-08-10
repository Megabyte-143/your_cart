import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './constant/theme_data.dart';

import './provider/cart_provider.dart';
import './provider/dark_theme_provider.dart';
import './provider/product_list_provider.dart';
import './provider/wishlist_provider.dart';

import './screens/auth/login_screen.dart';
import './screens/cart/cart_screen.dart';
import './screens/feeds screen/feeds_screen.dart';
import './screens/inner_screen/category_inner_screen.dart';
import './screens/inner_screen/popular_inner_screen.dart';
import 'screens/auth/landing_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/user_info_screen.dart';
import './screens/wishlist/wishlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  Future<void> getAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.themePreferences.getTheme();
  }

  @override
  void initState() {
    getAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
        ChangeNotifierProvider(create: (_) => ProductListProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Your Cart',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: const LandingScreen(),
            routes: {
              PopularBrandInnerScreen.routeName: (ctx) =>
                  const PopularBrandInnerScreen(),
              FeedsScreen.routeName: (ctx) => FeedsScreen(),
              CartScreen.routename: (ctx) => CartScreen(),
              WishlistScreen.routename: (ctx) => WishlistScreen(),
              ProductDetailScreen.routeName: (ctx) =>
                  const ProductDetailScreen(),
              CategoryInnerScreen.routeName: (ctx) => CategoryInnerScreen(),
              UserInfoScreen.routeName: (ctx) => UserInfoScreen(),
              LoginScreen.routeName: (ctx) => const LoginScreen(),
            },
          );
        },
      ),
    );
  }
}
