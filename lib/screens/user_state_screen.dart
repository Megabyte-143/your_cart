import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './auth/landing_screen.dart';
import './main_screens.dart';

class UserStateScreen extends StatelessWidget {
  const UserStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error Ocuured"),
          );
        } else if (snapshot.hasData) {
          return MainScreens();
        } else {
          return const LandingScreen();
        }
      },
    );
  }
}
