import 'package:bcc/api/token.dart';
import 'package:bcc/layout/signin/SignInBox.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkToken() async {
      if (await getToken() != null) {
        return Navigator.pushNamedAndRemoveUntil(
          context,
          "/",
          (route) => false,
        );
      }
    }

    checkToken();

    return Stack(
      children: [
        Image.asset(
          "images/signup_bg.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset("images/logo.png"),
                SizedBox(
                  height: 30,
                ),
                SignInBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
