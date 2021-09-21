import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

import '../../screens/cart/cart_screen.dart';
import '../../screens/wishlist/wishlist_screen.dart';
import '../constant/my_icons.dart';
import '../provider/dark_theme_provider.dart';
import '../wigets/alert_dialog.dart';
import '../wigets/user_info.dart';

class UserInfoScreen extends StatefulWidget {
  //const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();

  static const routeName = "/user-info-screen";
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late ScrollController _scrollController;
  double top = 0.0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  void route(
    BuildContext ctx,
    String routeName,
  ) {
    Navigator.of(ctx).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 5,
              expandedHeight: 200,
              pinned: true,
              backgroundColor: Colors.black,
              flexibleSpace: LayoutBuilder(
                builder: (ctx, constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.white,
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: top <= 100 ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 2,
                                  width: kToolbarHeight / 2,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/user.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Text(
                                  'Guest',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      background: const Image(
                        image: AssetImage('assets/images/user.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: UserInfoWidget().userTitle('User Bag'),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  UserInfoWidget().userBagTile('Wishlist', MyIcons.wishList,
                      () {
                    route(context, WishlistScreen.routename);
                  }),
                  UserInfoWidget().userBagTile('Cart', MyIcons.cart, () {
                    route(context, CartScreen.routename);
                  }),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: UserInfoWidget().userTitle('User Information'),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  UserInfoWidget().userTile(
                    'Email',
                    'Sub-email',
                    Icons.email,
                  ),
                  UserInfoWidget().userTile(
                    'Phone No.',
                    'Sub-email',
                    Icons.phone,
                  ),
                  UserInfoWidget().userTile(
                    'Shipping Address',
                    'Sub-email',
                    Icons.local_shipping,
                  ),
                  UserInfoWidget().userTile(
                    'Watch Later',
                    'Sub-email',
                    Icons.watch_later,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: UserInfoWidget().userTitle('App Settings'),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  ListTileSwitch(
                    value: themeChange.darkTheme,
                    onChanged: (value) {
                      setState(() {
                        themeChange.darkTheme = value;
                      });
                    },
                    switchActiveColor: Colors.black,
                    switchInactiveColor: Colors.grey,
                    title: const Text('Dark Theme'),
                    leading: const Icon(Icons.dark_mode),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.canPop(context)
                      //     ? Navigator.of(context).pop()
                      //     : null;
                      AlertDialogMethod().showDialogMethod(
                        "LOGOUT ?",
                        "Are you sure, you wanna leave?",
                        () async {
                          await _auth.signOut();
                        },
                        context,
                      );
                    },
                    child: UserInfoWidget().userTile(
                      'Logout',
                      'Sub-email',
                      Icons.exit_to_app,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        UserInfoWidget().userInfoCam(_scrollController),
      ],
    );
  }
}
