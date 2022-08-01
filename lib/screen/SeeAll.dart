import 'package:bcc/components/Navbar.dart';
import 'package:bcc/components/Search.dart';
import 'package:bcc/components/home/ProductCard.dart';
import 'package:bcc/components/seeAll/CategoryButton.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeAllScreen extends StatefulWidget {
  SeeAllScreen({Key? key}) : super(key: key);

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  @override
  Widget build(BuildContext context) {
    // var listProduct = Provider.of<ListProduct>(context);
    var listProduct = Provider.of<ListProduct>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/seeAll/ads.png",
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Search(
                      hintText: 'Try "Botol Plastik"',
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 20,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          CategoryButton(
                            content: Row(
                              children: [
                                Icon(
                                  Icons.tune,
                                  size: 10,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "Filter",
                                  style:
                                      AppText.desc(color: AppColor.textPrimary),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          CategoryButton(
                            content: Text(
                              "Recycling Trash",
                              style: AppText.desc(color: AppColor.textPrimary),
                            ),
                          ),
                          SizedBox(width: 8),
                          CategoryButton(
                            content: Text(
                              "Semi-Recycling Trash",
                              style: AppText.desc(color: AppColor.textPrimary),
                            ),
                          ),
                          SizedBox(width: 8),
                          CategoryButton(
                            content: Text(
                              "Non-Recycling Trash",
                              style: AppText.desc(color: AppColor.textPrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    GridView.count(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      padding: EdgeInsets.zero,
                      children: [
                        ...listProduct.products
                            .map((e) => ProductCard(e))
                            .toList(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
