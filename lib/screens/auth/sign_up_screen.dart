import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../wigets/auth_screen/alert_dialog.dart';
import '../../wigets/auth_screen/continue_divider.dart';
import '../../wigets/auth_screen/sign_button.dart';
import '../../wigets/auth_screen/sign_up_screen/image_header.dart';
import '../../wigets/landing_screen/guest_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/Sign-Up-Screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _phnNoNode = FocusNode();
  bool obscureText = true;
  String emailAdd = "";
  String pass = "";
  String name = "";
  late int phnNo;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final File _pickedImage = File("assets/images/user.png");
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }

  void submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      try {
        await _auth
            .createUserWithEmailAndPassword(
              email: emailAdd.toLowerCase().trim(),
              password: pass.trim(),
            )
            .then(
              (value) =>
                  Navigator.canPop(context) ? Navigator.pop(context) : null,
            );
      } catch (error) {
        AlertDialogMethod().showDialogMethod(
          error.toString(),
          context,
        );
        print("error occucered => $error");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
                size: Size.infinite,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                SignUpScreenImageHeader(),
                const SizedBox(
                  height: 10,
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
                          key: const ValueKey("Name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Valid Name";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            fillColor: Colors.white70,
                            border: UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            labelText: "Ful Name",
                          ),
                          onSaved: (value) {
                            name = value.toString();
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(_emailNode),
                        ),
                        // FormFields(
                        //   field: name,
                        //   icon: Icons.person,
                        //   keyboardType: TextInputType.name,
                        //   labelText: "Ful Name",
                        //   node: _emailNode,
                        //   valMessage: "Please Enter Valid Name",
                        //   valueKey: "Name",
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          focusNode: _emailNode,
                          key: const ValueKey("Email"),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
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
                            emailAdd = value.toString();
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(_phnNoNode),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          focusNode: _phnNoNode,
                          key: const ValueKey("PhoneNumber"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Valid Phone Number";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            fillColor: Colors.white70,
                            border: UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone Number",
                          ),
                          onSaved: (value) {
                            phnNo = int.parse(value.toString());
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordNode),
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
                          focusNode: _passwordNode,
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
                            pass = value.toString();
                          },
                          onEditingComplete: submitForm,
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
                    if (_isLoading)
                      const CircularProgressIndicator()
                    else
                      SignButton(
                        title: "Sign Up",
                        icon: Icons.person_add,
                        onTap: () {
                          submitForm();
                        },
                      ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                const AuthScreenContinueDivider(
                  color: Colors.black,
                  fontSize: 25,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AuthScreenGuestButton(
                      title: "Google +",
                      onTap: () {},
                    ),
                    AuthScreenGuestButton(
                      title: "Facebook",
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
