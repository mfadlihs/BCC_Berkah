import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileStore extends StatelessWidget {
  const ProfileStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Store",
            style: AppText.subheader(),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Image.asset(
                "images/store_icon.png",
                width: 56,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toko Botol Plastik",
                    style: AppText.title(),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "99+ ",
                          style: AppText.desc(color: AppColor.secondary2),
                          children: [
                            TextSpan(
                              text: "Product",
                              style: AppText.desc(
                                color: AppColor.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          text: "• ",
                          style: AppText.desc(color: AppColor.secondary2),
                          children: [
                            TextSpan(
                              text: "Surabaya",
                              style: AppText.desc(
                                color: AppColor.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/product");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.store_mall_directory),
                    SizedBox(width: 9),
                    Text(
                      "See Store",
                      style: AppText.subtitle(),
                    ),
                  ],
                ),
                Icon(
                  Icons.navigate_next,
                  color: AppColor.secondary2,
                  size: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/product");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Icon(Icons.store_mall_directory),
                    SizedBox(width: 4),
                    FaIcon(
                      FontAwesomeIcons.box,
                      size: 18,
                    ),
                    SizedBox(width: 13),
                    Text(
                      "Product",
                      style: AppText.subtitle(),
                    ),
                  ],
                ),
                Icon(
                  Icons.navigate_next,
                  color: AppColor.secondary2,
                  size: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.add_circle,
                    color: AppColor.textPrimary,
                  ),
                  SizedBox(width: 9),
                  Text(
                    "Add Product",
                    style: AppText.subtitle(),
                  ),
                ],
              ),
              Icon(
                Icons.navigate_next,
                color: AppColor.secondary2,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
