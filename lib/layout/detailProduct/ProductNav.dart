import 'package:bcc/Function/Tes.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductNavBar extends StatefulWidget {
  ProductNavBar({Key? key}) : super(key: key);

  @override
  State<ProductNavBar> createState() => _ProductNavBarState();
}

class _ProductNavBarState extends State<ProductNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        vertical: 19,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: AppColor.secondary1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rp 625.000",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "${Tes.angka} item",
                style: AppText.subtitle(
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  // widget.angka++;
                });
              },
              child: Row(
                children: [
                  Text(
                    "Add to basket",
                    style: AppText.title(),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.shopping_basket_outlined,
                    size: 16,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
