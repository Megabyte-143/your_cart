import 'package:flutter/material.dart';

class AlertDialogMethod {
  Future<void> showDialogMethod(
    String subTitle,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: const [
              Text("Error Occured"),
            ],
          ),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
