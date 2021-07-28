import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

import '../constant/my_icons.dart';

import '../screens/cart/cart_screen.dart';

import 'feeds_screen.dart';
import 'home screen/home_screen.dart';
import 'search_screen.dart';
import 'user_info_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Widget>> _pages = [{}];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const HomeScreen()},
      {'page': FeedsScreen()},
      {'page': const SearchScreen()},
      {'page': CartScreen()},
      {'page': UserInfoScreen()},
    ];
    super.initState();
  }

  void _submitPageIndex(int pageIndex) {
    setState(() {
      _selectedPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 1,
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              backgroundBlendMode: BlendMode.color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedPageIndex,
              onTap: _submitPageIndex,
              selectedItemColor: darkTheme ? Colors.yellow : Colors.black,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.rss,
                  ),
                  label: 'Feeds',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(null),
                  activeIcon: null,
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.cart,
                  ),
                  label: 'Your Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyIcons.userInfo,
                  ),
                  label: 'Your Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          tooltip: 'Search',
          autofocus: true,
          splashColor: Colors.yellow,
          hoverColor: Colors.black,
          backgroundColor: Colors.black,
          elevation: 5,
          onPressed: () {
            setState(() {
              _selectedPageIndex = 2;
            });
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
