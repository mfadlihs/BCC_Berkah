import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  int id;
  ProductImage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: id,
          child: Container(
            height: 355,
            width: double.infinity,
            child: Image.asset(
              "images/detailProduct/$id.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 44,
          left: 16,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
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
