import 'package:flutter/material.dart';

import 'pic_dialog_option.dart';

class SignUpScreenPicDialog extends StatefulWidget {
  const SignUpScreenPicDialog({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpScreenPicDialogState createState() => _SignUpScreenPicDialogState();
}

class _SignUpScreenPicDialogState extends State<SignUpScreenPicDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 20,
      title: const Text(
        "Choose an Option",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.redAccent,
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          mainAxis: Axis.vertical,
          children: [
            SignUpScreenPicDialofOptions(
              icon: Icons.camera,
              onTap: () {},
              title: 'Camera',
            ),
            const SizedBox(
              height: 20,
            ),
            SignUpScreenPicDialofOptions(
              icon: Icons.photo,
              onTap: () {},
              title: 'Gallery',
            ),
            const SizedBox(
              height: 20,
            ),
            SignUpScreenPicDialofOptions(
              icon: Icons.remove_circle,
              onTap: () {},
              title: 'Remove',
            ),
          ],
        ),
      ),
    );
  }
}
