import 'package:bcc/Function/Uang.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  Product data;

  ProductCard(this.data);

  void navigate(BuildContext context) {
    Navigator.pushNamed(context, '/detail-product', arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigate(context);
      },
      child: Container(
        width: double.infinity,
        height: 180,
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
              Hero(
                tag: data.id,
                child: Image.asset(
                  "images/detailProduct/${data.id}.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
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
                            data.type(),
                            style: AppText.desc(),
                          ),
                          Text(
                            data.name,
                            style: AppText.body(),
                          ),
                          Text(
                            uang(data.harga),
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
                  padding:
                      EdgeInsets.only(top: 1, bottom: 1, left: 3, right: 6),
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
      ),
    );
    ;
  }
}
