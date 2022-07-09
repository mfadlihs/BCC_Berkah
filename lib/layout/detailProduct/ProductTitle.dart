import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatefulWidget {
  const ProductTitle({Key? key}) : super(key: key);

  _ProductTitle createState() => _ProductTitle();
}

class _ProductTitle extends State<ProductTitle> {
  @override
  Widget build(BuildContext context) {
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
                "Recycling Trash",
                style: AppText.subtitle(
                  color: AppColor.textSecondary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Biji Plastik 25kg",
                style: AppText.header(),
              ),
              SizedBox(height: 8),
              Text(
                "Rp 625.000",
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
            onPressed: () {},
            shape: CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.favorite_outline,
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
