import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketHeader extends StatefulWidget {
  BasketHeader({Key? key}) : super(key: key);

  @override
  State<BasketHeader> createState() => _BasketHeaderState();
}

class _BasketHeaderState extends State<BasketHeader> {
  bool isSelectedAll = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(8),
                ),
                child: Icon(
                  Icons.navigate_before,
                ),
              ),
              SizedBox(width: 8),
              Text("Basket", style: AppText.subheader()),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "Delivery address",
              style: AppText.subtitle(color: AppColor.textSecondary),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isSelectedAll,
                    onChanged: (bool? val) {
                      setState(() {
                        isSelectedAll = val!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: AppColor.textPrimary,
                    activeColor: AppColor.primary,
                  ),
                  SizedBox(width: 8),
                  Text("Choose All", style: AppText.subtitle()),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Malang, Jawa Timur",
                    style: AppText.subtitle(),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down, size: 16),
                ],
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
