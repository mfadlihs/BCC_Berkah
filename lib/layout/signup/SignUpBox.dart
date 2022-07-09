// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bcc/screen/SignIn.dart';
import 'package:bcc/screen/Splash.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpBox extends StatefulWidget {
  SignUpBox({Key? key}) : super(key: key);

  @override
  State<SignUpBox> createState() => _SignUpBoxState();
}

class _SignUpBoxState extends State<SignUpBox> {
  bool isChecked = false;

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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
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
                    child: TextFormField(
                      obscureText: true,
                      style: AppText.subtitle(),
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
                      onPressed: () {},
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
