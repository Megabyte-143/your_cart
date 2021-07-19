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
        style: const TextStyle(
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
    const double defaultTopMargin = 200 - 4;
    const double scaleStart = 160;
    const double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1;
    if (scrollController.hasClients) {
      final double offset = scrollController.offset;
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
      top: top,
      right: 16,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: const FloatingActionButton(
          heroTag: 'btn1',
          onPressed: null,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}