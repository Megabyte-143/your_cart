import 'package:flutter/material.dart';

class SignUpScreenPicDialofOptions extends StatelessWidget {
  const SignUpScreenPicDialofOptions({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber.shade100,
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Icon(
            icon,
            color: Colors.yellow.shade900,
          ),
        ],
      ),
    );
  }
}
