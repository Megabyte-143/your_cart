import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth/landing_screen.dart';
import 'main_screen.dart';

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
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            MainScreens();
          } else {
            const LandingScreen();
          }
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error Ocuured"),
          );
        }
        return const Center(
          child: Text("Error Ocuured"),
        );
      },
    );
  }
}
