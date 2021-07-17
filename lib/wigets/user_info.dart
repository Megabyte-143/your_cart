import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  //const UserInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  final List<IconData> _userTitleIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app,
  ];

  Widget userTitle(String userTitle) {
    return Text(userTitle,
        style: TextStyle(
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

  Widget userInfoCam(ScrollController scrollController) {
    scrollController = scrollController;
    final double defaultTopMargin = 200 - 4;
    final double scaleStart = 160;
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        scale = 1;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: 'btn1',
          onPressed: null,
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
      ),
      top: top,
      right: 16,
    );
  }
}
