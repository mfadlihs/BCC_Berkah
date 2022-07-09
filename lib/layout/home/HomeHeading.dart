import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var HomeHeading = Stack(
  children: [
    Image.asset("images/home_bg.png"),
    Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45),
          Text(
            "Delivery address",
            style: AppText.title(color: AppColor.white),
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Text(
                "Malang, Jawa Timur",
                style: AppText.title(),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColor.primary),
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0.1,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_activity,
                  size: 18,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GAMA Coupons",
                      style: AppText.desc(color: AppColor.textSecondary),
                    ),
                    Text(
                      "20 Coupons",
                      style: AppText.subtitle(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ],
);
