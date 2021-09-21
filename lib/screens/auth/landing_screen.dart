import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../screens/auth/login_screen.dart';
import '../../screens/auth/sign_up_screen.dart';
import '../../screens/bottom_bar_screen.dart';

import '../../wigets/auth_screen/alert_dialog.dart';
import '../../wigets/auth_screen/continue_divider.dart';
import '../../wigets/landing_screen/guest_button.dart';
import '../../wigets/landing_screen/sign_button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  List<String> images = [
    'https://scontent.fdel27-2.fna.fbcdn.net/v/t1.6435-9/132190833_108376851168802_522196797208854939_n.jpg?_nc_cat=105&ccb=1-4&_nc_sid=e3f864&_nc_ohc=oxuwMDS0XxgAX--tRRn&_nc_ht=scontent.fdel27-2.fna&oh=a67c367be311efc156d37e65872427f7&oe=6134065A',
    'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1138257321%2F0x0.jpg%3Ffit%3Dscale',
    'https://e-shopy.org/wp-content/uploads/2020/08/shop.jpeg',
    'https://e-shopy.org/wp-content/uploads/2020/08/shop.jpeg',
  ];
  late AnimationController _animationController;
  late Animation<double> _animation;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    images.shuffle();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationstatus) {
            if (animationstatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
            super.initState();
          });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
        } catch (error) {
          ErrorDialogMethod().showDialogMethod(error.toString(), context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: images[0],
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            // placeholder: (context, imageUrl) => Image.network(
            //   'https://media.wired.com/photos/5c9040ee4950d24718d6da99/16:9/w_2400,h_1350,c_limit/shoppingcart-1066110386.jpg',
            //   fit: BoxFit.cover,
            // ),
            alignment: FractionalOffset(_animation.value, 0),
            errorWidget: (context, imageUrl, error) => const Icon(
              Icons.error,
              size: 40,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to the future of shopping",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    LandingScreenSignButton(
                      title: "Login In",
                      icon: Icons.person,
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    LandingScreenSignButton(
                      title: "Sign Up",
                      icon: Icons.person_add,
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const AuthScreenContinueDivider(
                  color: Colors.amber,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AuthScreenGuestButton(
                      title: "Google +",
                      onTap: () {
                        googleSignIn();
                      },
                    ),
                    AuthScreenGuestButton(
                      title: "Login as a Guest",
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(BottomBarScreen.routeName);
                      },
                    ),
                  ],
                ),
                const Divider(
                  indent: 15,
                  endIndent: 15,
                  thickness: 2,
                  color: Colors.black45,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
