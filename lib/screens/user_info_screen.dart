import 'package:flutter/material.dart';

import '../wigets/user_info.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          child: UserInfo().userTitle('User Title'),
          padding: EdgeInsets.all(10),
        ),
        Divider(thickness: 5,),
        UserInfo().userTitleTile('Email', 'Sub-email', 0),
        UserInfo().userTitleTile('Phone No.', 'Sub-email', 1),
        UserInfo().userTitleTile('Shipping Address', 'Sub-email', 2),
        UserInfo().userTitleTile('Watch Later', 'Sub-email', 3),
        UserInfo().userTitleTile('Logout', 'Sub-email', 4),
      ],
    );
  }
}
