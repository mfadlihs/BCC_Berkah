import 'package:bcc/class/Product.dart';
import 'package:bcc/components/home/ProductCard.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularProduct extends StatefulWidget {
  List<Product> data;
  PopularProduct({Key? key, required this.data}) : super(key: key);

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  @override
  Widget build(BuildContext context) {
    var data = widget.data;

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
                    onPressed: () {
                      Navigator.pushNamed(context, '/see-all');
                    },
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
        SizedBox(height: 16),
        Container(
          height: 185,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...(data.map((e) {
                return Container(
                  width: 160,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ProductCard(e),
                );
              }).toList()),
            ],
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class PopularProductWaiting extends StatelessWidget {
  const PopularProductWaiting({Key? key}) : super(key: key);

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
                    onPressed: () {
                      Navigator.pushNamed(context, '/see-all');
                    },
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
          width: double.infinity,
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        )
      ],
    );
  }
}
