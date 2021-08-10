import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../wigets/auth_screen/login_screen/sign_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "/Login-Screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  String _emailAdd = "";
  String _pass = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.99,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.red, const Color(0xEEF44336)],
                    [Colors.red.shade800, const Color(0x77E57373)],
                    [Colors.orange, const Color(0x66FF9800)],
                    [Colors.white, const Color(0x55FFEB3B)]
                  ],
                  durations: [35000, 19440, 10800, 6000],
                  heightPercentages: [0.20, 0.23, 0.25, 0.30],
                  blur: const MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                backgroundColor: Colors.white,
                isLoop: true,
                size: const Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://scontent.fdel27-2.fna.fbcdn.net/v/t1.6435-9/132190833_108376851168802_522196797208854939_n.jpg?_nc_cat=105&ccb=1-4&_nc_sid=e3f864&_nc_ohc=oxuwMDS0XxgAX--tRRn&_nc_ht=scontent.fdel27-2.fna&oh=a67c367be311efc156d37e65872427f7&oe=6134065A',
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        key: const ValueKey("Email"),
                        validator: (value) {
                          if (value!.isEmpty || value.contains('@')) {
                            return "Please Enter Valid Email Address";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          fillColor: Colors.white70,
                          border: UnderlineInputBorder(),
                          filled: true,
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email Address",
                        ),
                        onSaved: (value) {
                          _emailAdd = value.toString();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        key: const ValueKey("Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Valid Password";
                          }
                          return null;
                        },
                        obscureText: obscureText,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white70,
                          border: const UnderlineInputBorder(),
                          filled: true,
                          prefixIcon: const Icon(Icons.vpn_key),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: obscureText
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                        onSaved: (value) {
                          _pass = value.toString();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  LoginScreenSignButton(
                    title: "Login In",
                    icon: Icons.person,
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
