import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var HomeJumbotron = Container(
  height: 155,
  child: ListView(
    padding: EdgeInsets.only(left: 7, right: 7),
    scrollDirection: Axis.horizontal,
    children: [
      ...([1, 2, 3].map((e) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Image.asset(
            'images/jumbotron/$e.png',
            fit: BoxFit.contain,
          ),
        );
      })),
    ],
  ),
);
