import 'package:bcc/class/Toko.dart';
import 'package:bcc/components/home/ProductCard.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreContent extends StatefulWidget {
  Toko data;
  StoreContent(this.data, {Key? key}) : super(key: key);

  @override
  State<StoreContent> createState() => _StoreContentState();
}

class _StoreContentState extends State<StoreContent> {
  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product",
            style: AppText.subheader(),
          ),
          SizedBox(height: 8),
          GridView.count(
            physics: ScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            children: [
              // ...listProduct.products.map((e) => ProductCard(e)).toList(),
              ...listProduct.products
                  .where((element) => element.idToko == widget.data.id)
                  .map((e) => ProductCard(e))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
