import 'package:bcc/Function/Product.dart';
import 'package:bcc/Function/Tes.dart';
import 'package:bcc/layout/detailProduct/ProductBuy.dart';
import 'package:bcc/layout/detailProduct/ProductDesc.dart';
import 'package:bcc/layout/detailProduct/ProductImage.dart';
import 'package:bcc/layout/detailProduct/ProductNav.dart';
import 'package:bcc/layout/detailProduct/ProductTitle.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  var divider = Container(
    width: double.infinity,
    height: 1,
    color: AppColor.secondary1,
  );

  int angka = 1;

  Product data = Product(harga: 625000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(),
            ProductTitle(),
            divider,
            ProductBuy(),
            divider,
            ProductDescription(),
          ],
        ),
      ),
      bottomNavigationBar: ProductNavBar(),
    );
  }
}
