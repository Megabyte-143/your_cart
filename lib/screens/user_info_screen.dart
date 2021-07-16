import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../wigets/user_info.dart';

class UserInfoScreen extends StatefulWidget {
  //const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          child: UserInfo().userTitle('App Settings'),
          padding: EdgeInsets.all(10),
        ),
        Divider(
          thickness: 2,
        ),
        ListTileSwitch(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          switchActiveColor: Colors.black,
          switchInactiveColor: Colors.grey,
          title: Text('Dark Theme'),
          leading: Icon(Icons.dark_mode),
        ),
        UserInfo().userTitleTile('Logout', 'Sub-email', 4),
      ],
    );
  }
}
