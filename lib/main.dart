import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './constant/theme_data.dart';

import './provider/dark_theme_provider.dart';

import './screens/bottom_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getAppTheme() async {
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
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
          );
        },
      ),
    );
  }
}
