import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBasket extends StatefulWidget {
  CardBasket({Key? key}) : super(key: key);

  @override
  State<CardBasket> createState() => _CardBasketState();
}

class _CardBasketState extends State<CardBasket> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14, right: 14, left: 14, bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 6,
            color: Color.fromRGBO(0, 0, 0, .25),
          )
        ],
        border: Border.all(
          width: 1,
          color: AppColor.primary,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? val) {
                      setState(() {
                        isChecked = val!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: AppColor.textPrimary,
                    activeColor: AppColor.primary,
                  ),
                  SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Toko Botol Plastik",
                        style: AppText.subtitle(),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "• ",
                          style: AppText.desc(color: AppColor.secondary2),
                          children: [
                            TextSpan(
                              text: "Surabaya",
                              style: TextStyle(color: AppColor.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.rotate(
                angle: 40,
                child: Icon(
                  Icons.add_circle,
                  size: 20,
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? val) {
                  setState(() {
                    isChecked = val!;
                  });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: AppColor.textPrimary,
                activeColor: AppColor.primary,
              ),
              SizedBox(width: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "images/product_icon.png",
                  width: 48,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biji Plastik 25kg",
                    style: AppText.subtitle(),
                  ),
                  Text(
                    "Rp 625.000",
                    style: AppText.body(color: AppColor.secondary2),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.remove,
                  size: 16,
                  color: AppColor.secondary2,
                ),
              ),
              SizedBox(width: 30),
              Text(
                "1",
                style: AppText.subheader(),
              ),
              SizedBox(width: 30),
              IconButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.add,
                  size: 16,
                  color: AppColor.secondary2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
