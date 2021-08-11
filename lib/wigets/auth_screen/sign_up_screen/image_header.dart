import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../wigets/auth_screen/sign_up_screen/pic_dialog_option.dart';

class SignUpScreenImageHeader extends StatefulWidget {
  @override
  _SignUpScreenImageHeaderState createState() =>
      _SignUpScreenImageHeaderState();
}

class _SignUpScreenImageHeaderState extends State<SignUpScreenImageHeader> {
  File _pickedImage = File("assets/images/user.png");
  void _camera() async {
    final picker = ImagePicker();
    final pickedImagePath = await picker.pickImage(source: ImageSource.camera);
    final File pickedImage = File(pickedImagePath!.path);
    setState(() {
      _pickedImage = pickedImage;
    });
    Navigator.of(context).pop();
  }

  void _gallery() async {
    final picker = ImagePicker();
    final pickedImagePath = await picker.pickImage(source: ImageSource.gallery);
    final File pickedImage = File(pickedImagePath!.path);
    setState(() {
      _pickedImage = pickedImage;
    });
    Navigator.of(context).pop();
  }

  void _removeImage() {
    setState(() {
      _pickedImage = File("assets/images/user.png");
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Colors.orangeAccent,
            child: CircleAvatar(
              radius: 68,
              backgroundImage: FileImage(_pickedImage),
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 100,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(25),
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
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
                              onTap: _camera,
                              title: 'Camera',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SignUpScreenPicDialofOptions(
                              icon: Icons.photo,
                              onTap: _gallery,
                              title: 'Gallery',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SignUpScreenPicDialofOptions(
                              icon: Icons.remove_circle,
                              onTap: _removeImage,
                              title: 'Remove',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const CircleAvatar(
                radius: 25,
                child: Icon(
                  Icons.add_a_photo,
                  size: 33,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
