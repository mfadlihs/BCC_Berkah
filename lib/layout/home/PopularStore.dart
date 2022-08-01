import 'package:bcc/components/home/StoreCard.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularStore extends StatelessWidget {
  const PopularStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context);
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
                    "Popular Store",
                    style: AppText.title(),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "The most visited store",
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            children: listProduct.toko.map((e) => StoreCard(e)).toList(),
          ),
        )
      ],
    );
  }
}
