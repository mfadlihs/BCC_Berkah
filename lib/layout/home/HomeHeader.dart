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
      TextField(
        style: AppText.subtitle(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 18,
          ),
          isDense: true,
          hintText: 'Try "Botol Plastik"',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          filled: true,
        ),
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
