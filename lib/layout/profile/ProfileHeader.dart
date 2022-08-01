import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "images/profile_icon.png",
                width: 56,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gama User",
                    style: AppText.title(),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "gamauser@gmail.com",
                    style: AppText.body(color: AppColor.textSecondary),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(),
          Container(
            height: 48,
            width: 1.5,
            color: Color(0xFFE0E0E0),
          ),
          Row(
            children: [
              Icon(
                Icons.local_activity,
                size: 18,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GAMA Coupons",
                    style: AppText.desc(),
                  ),
                  Text(
                    "20 Coupons",
                    style: AppText.subtitle(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
