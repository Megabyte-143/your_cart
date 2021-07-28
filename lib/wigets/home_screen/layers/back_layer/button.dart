import 'package:flutter/material.dart';

class BackLayerButton extends StatelessWidget {
  BackLayerButton(
    this.text,
    this.route,
    this.iconData,
  );
  final String text;
  final IconData iconData;
  VoidCallback route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: route,
      child: Container(
        width: double.infinity,
        //color: Colors.yellow,
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                text,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(iconData),
          ],
        ),
      ),
    );
  }
}
