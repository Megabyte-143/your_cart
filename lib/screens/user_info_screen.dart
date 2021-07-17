import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../provider/dark_theme_provider.dart';

import '../wigets/user_info.dart';

class UserInfoScreen extends StatefulWidget {
  //const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late ScrollController _scrollController;
  double top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
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
              flexibleSpace: LayoutBuilder(builder: (ctx, constraints) {
                top = constraints.biggest.height;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.white,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
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
                          duration: Duration(milliseconds: 300),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                height: kToolbarHeight / 3,
                                width: kToolbarHeight / 1.8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/assets/images/user.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
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
                    background: Image(
                      image: AssetImage('assets/images/user.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    child: UserInfo().userTitle('User Information'),
                    padding: EdgeInsets.all(10),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  UserInfo().userTitleTile('Email', 'Sub-email', 0),
                  UserInfo().userTitleTile('Phone No.', 'Sub-email', 1),
                  UserInfo().userTitleTile('Shipping Address', 'Sub-email', 2),
                  UserInfo().userTitleTile('Watch Later', 'Sub-email', 3),
                  UserInfo().userTitleTile('Watch Later', 'Sub-email', 3),
                  UserInfo().userTitleTile('Watch Later', 'Sub-email', 3),
                  UserInfo().userTitleTile('Watch Later', 'Sub-email', 3),
                  UserInfo().userTitleTile('Watch Later', 'Sub-email', 3),
                  Padding(
                    child: UserInfo().userTitle('App Settings'),
                    padding: EdgeInsets.all(10),
                  ),
                  Divider(
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
                    leading: Icon(Icons.dark_mode),
                  ),
                  UserInfo().userTitleTile('Logout', 'Sub-email', 4),
                ],
              ),
            ),
          ],
        ),
        UserInfo().userInfoCam(_scrollController),
      ],
    );
  }
}
