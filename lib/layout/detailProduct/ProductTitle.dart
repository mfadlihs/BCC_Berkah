import 'package:bcc/Function/Uang.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTitle extends StatefulWidget {
  Product data;
  ProductTitle({Key? key, required this.data}) : super(key: key);

  _ProductTitle createState() => _ProductTitle();
}

class _ProductTitle extends State<ProductTitle> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context);
    var _data = widget.data;

    return Padding(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _data.type(),
                style: AppText.subtitle(
                  color: AppColor.textSecondary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _data.name,
                style: AppText.header(),
              ),
              SizedBox(height: 8),
              Text(
                uang(_data.harga),
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.secondary2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          MaterialButton(
            color: AppColor.secondary1,
            onPressed: () {
              listProduct.favourite(_data.id);
              setState(() {
                isFavorite = true;
              });
            },
            shape: CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: Colors.red,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
