import 'package:bcc/Function/Tes.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/layout/detailProduct/ProductBuy.dart';
import 'package:bcc/layout/detailProduct/ProductDesc.dart';
import 'package:bcc/layout/detailProduct/ProductDetail.dart';
import 'package:bcc/layout/detailProduct/ProductImage.dart';
import 'package:bcc/layout/detailProduct/ProductNav.dart';
import 'package:bcc/layout/detailProduct/ProductTitle.dart';
import 'package:bcc/providers/ProviderDetail.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  x() {
    Navigator.pushNamed(
      context,
      "/",
      arguments: Product(1, 1, 'w', 2, 'w', 2),
    );
  }

  int angka = 1;

  @override
  Widget build(BuildContext context) {
    var amount = Provider.of<ProviderDetail>(context);

    final data = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(id: data.id),
            ProductTitle(
              data: data,
            ),
            divider,
            ProductBuy(),
            divider,
            ProductDescription(
              desc: data.desc,
            ),
            divider,
            ProductDetail(),
          ],
        ),
      ),
      bottomNavigationBar: ProductNavBar(data.harga),
    );
  }
}
