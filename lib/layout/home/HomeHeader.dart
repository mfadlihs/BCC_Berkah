import 'package:bcc/components/Search.dart';
import 'package:bcc/components/home/HomeCategory.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var HomeHeader = Container(
  padding: EdgeInsets.symmetric(horizontal: 14),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Find Your Need",
        style: AppText.header(),
      ),
      Search(
        hintText: 'Try "Botol Plastik"',
      ),
      SizedBox(height: 8),
      Wrap(
        spacing: 8,
        children: [
          HomeCategory(
            content: "Recycling Trash",
          ),
          HomeCategory(
            content: "Semi-Recycling Trash",
          ),
          HomeCategory(
            content: "Non-Recycling Trash",
          ),
        ],
      ),
    ],
  ),
);
