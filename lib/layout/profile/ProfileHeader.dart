import 'package:bcc/class/User.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  User data;

  ProfileHeader(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  data.link_foto,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.nama,
                    style: AppText.title(),
                  ),
                  SizedBox(height: 4),
                  Text(
                    data.email,
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
