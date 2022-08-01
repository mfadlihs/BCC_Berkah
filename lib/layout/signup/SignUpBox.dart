// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';

import 'package:bcc/components/showNotif.dart';
import 'package:bcc/screen/SignIn.dart';
import 'package:bcc/screen/Splash.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:http/http.dart' as http;

class SignUpBox extends StatefulWidget {
  SignUpBox({Key? key}) : super(key: key);

  @override
  State<SignUpBox> createState() => _SignUpBoxState();
}

class _SignUpBoxState extends State<SignUpBox> {
  bool isChecked = false;

  final formKey = GlobalKey<FormState>();

  // https://garbage-market-2022.herokuapp.com/metadata/register

  String email = "";
  String password = "";
  String confirmPassword = "";

  handleSignUp() async {
    try {
      var res = await http.post(
        Uri.https("garbage-market-2022.herokuapp.com", "metadata/register"),
        body: jsonEncode(
          <String, String>{
            "email": email,
            "password": password,
          },
        ),
      );

      print(res.body);

      var result = json.decode(res.body)['body'];

      var token = result['token'];
      print(result);
      print(token);

      showNotif("Berhasil Register", context);
      Timer(Duration(seconds: 2), () {});

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (route) => false,
      );
    } catch (e) {
      print(e);
      showNotif("Gagal Register", context);
    }
  }

  var header = [
    Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Text(
        "Sign Up",
        style: AppText.header(),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        "Please Sign Up, first!",
        style: AppText.desc(),
      ),
    ),
  ];

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
            ...header,
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    // email
                    child: TextFormField(
                      onChanged: (String? value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an email";
                        }
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
                    // password
                    child: TextFormField(
                      onChanged: (String? value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        }
                      },
                      obscureText: true,
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
                    // confirm password
                    child: TextFormField(
                      obscureText: true,
                      style: AppText.subtitle(),
                      onChanged: (String? value) {
                        setState(() {
                          confirmPassword = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 15,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: 'Confirm Password',
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          showNotif("Register...", context);
                          handleSignUp();
                        }
                      },
                      child: Text(
                        "Sign Up",
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
                      text: "Sign In",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) {
                              return SigninScreen();
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
