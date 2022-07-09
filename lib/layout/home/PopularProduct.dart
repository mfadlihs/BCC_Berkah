import 'package:bcc/components/home/ProductCard.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Products",
                    style: AppText.title(),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "The most popular of all garbage types",
                    style: AppText.subtitle(color: AppColor.textSecondary),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "See all",
                    style: AppText.body(),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      elevation: 0,
                      primary: AppColor.secondary1,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Icon(Icons.navigate_next),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 185,
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...([1, 2, 3, 4, 5, 6].map((e) => ProductCard(e)).toList()),
            ],
          ),
        )
      ],
    );
  }
}
