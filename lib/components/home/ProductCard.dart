import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final num counter;

  ProductCard(this.counter);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 18),
      width: 160,
      height: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: AppColor.secondary1,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Image.asset(
              "images/Home/product_${(counter % 2) + 1}.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(
                    color: AppColor.secondary1,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Non-Recycling Trash",
                          style: AppText.desc(),
                        ),
                        Text(
                          "Botol Plastik",
                          style: AppText.body(),
                        ),
                        Text(
                          "Rp 1.000",
                          style: AppText.body(color: AppColor.primary),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.shopping_basket_outlined,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColor.secondary1,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 27,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(top: 1, bottom: 1, left: 3, right: 6),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Home/discount.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  "15%",
                  style: AppText.body(color: AppColor.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
