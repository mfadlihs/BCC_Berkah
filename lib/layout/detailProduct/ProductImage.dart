import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 355,
          child: Image.asset(
            "images/detailProduct/product.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 44,
          left: 16,
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.secondary2,
              ),
              child: Icon(
                Icons.navigate_before,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
