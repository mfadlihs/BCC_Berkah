// ignore_for_file: prefer_const_constructors

import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: AppColor.primary,
          image: DecorationImage(
            image: AssetImage("images/landing_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/landing.png"),
            SizedBox(height: 20),
            Text(
              "Save Our Living Environment",
              style: AppText.header(),
            ),
            Text(
              "with Deliver Your Garbage to Your Business",
              style: AppText.subtitle(),
            ),
            SizedBox(height: 40),
            ClipRRect(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary1,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "NEXT",
                  style: AppText.title(
                    lineHeight: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
