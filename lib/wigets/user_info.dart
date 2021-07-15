import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  //const UserInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  final List<IconData> _userTitleIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app,
  ];

  Widget userTitle(String userTitle) {
    return Text(userTitle,style:TextStyle(
      fontSize: 24,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ));
  }

  Widget userTitleTile(String title, String subtitle, int index) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(_userTitleIcons[index]),
    );
  }
}
