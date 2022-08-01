import 'dart:async';

import 'package:bcc/themes/AppText.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/landing');
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColor.secondary2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Image.asset('images/icon_splash.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          "images/lh.png",
                          width: 39,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Kementerian\nLingkungan Hidup & Kehutanan\nRepublik Indonesia",
                          style: AppText.desc(
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      width: 47,
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: "ENVITECH",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xFF264323),
                      ),
                      children: [
                        TextSpan(
                            text: ".Inc",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
