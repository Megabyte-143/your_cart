import 'package:flutter/material.dart';

class BackLayerButton extends StatelessWidget {
  const BackLayerButton(
    this.text,
    this.route,
    this.iconData,
  );
  final String text;
  final IconData iconData;
  final VoidCallback route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: route,
      child: Container(
        width: double.infinity,
        //color: Colors.yellow,
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                text,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(iconData),
          ],
        ),
      ),
    );
  }
}
