// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';

import 'package:bcc/components/showNotif.dart';
import 'package:bcc/screen/Home.dart';
import 'package:bcc/screen/SignUp.dart';
import 'package:bcc/screen/Splash.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignInBox extends StatefulWidget {
  SignInBox({Key? key}) : super(key: key);

  @override
  State<SignInBox> createState() => _SignInBoxState();
}

class _SignInBoxState extends State<SignInBox> {
  bool isChecked = false;
  final navigator = Navigator();

  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  handleSignin() async {
    var prefs = await SharedPreferences.getInstance();

    try {
      var res = await http.post(
        Uri.https("garbage-market-2022.herokuapp.com", "metadata/login"),
        body: jsonEncode(
          <String, String>{
            "email": email,
            "password": password,
          },
        ),
      );

      var token = await json.decode(res.body)['body']['token'];
      await prefs.setString('token', '$token');

      // showNotif("Berhasil login", context);
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Berhasil Login, selamat berbelanja",
        ),
      );
      Timer(Duration(seconds: 2), () {});

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (route) => false,
      );
    } catch (e) {
      print("error");
      print(e);

      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Email/Password yang anda masukkan salah",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 40,
      ),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(
                "Sign In",
                style: AppText.header(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "Please enter email and password!",
                style: AppText.desc(),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String? val) {
                        setState(() {
                          email = val!;
                        });
                      },
                      style: AppText.subtitle(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          size: 15,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      onChanged: (String? value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      style: AppText.subtitle(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 15,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: AppColor.secondary2,
                          checkColor: AppColor.white,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        SizedBox(width: 8),
                        RichText(
                          text: TextSpan(
                            text: "I agree to all the ",
                            style: AppText.desc(),
                            children: [
                              TextSpan(
                                text: "Terms and condition\n",
                                style: TextStyle(
                                  color: AppColor.secondary2,
                                ),
                              ),
                              TextSpan(
                                text: "and ",
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: AppColor.secondary2,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppColor.gray,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR",
                            style: AppText.subtitle(
                              color: AppColor.gray,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppColor.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: SignInButton(
                      Buttons.Google,
                      onPressed: () {},
                      text: "Sign In With Google",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          showNotif("Login....", context);
                          await handleSignin();
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: AppText.title(),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Dont have an account yet? ",
                  style: AppText.desc(),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) {
                              return SignUpScreen();
                            }),
                          );
                        },
                      style: TextStyle(
                        color: AppColor.secondary1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
