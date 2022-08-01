import 'package:bcc/components/Search.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreHeader extends StatefulWidget {
  int id;
  StoreHeader(this.id, {Key? key}) : super(key: key);

  @override
  State<StoreHeader> createState() => _StoreHeaderState();
}

class _StoreHeaderState extends State<StoreHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 50,
        left: 15,
        right: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(84, 186, 185, 1),
            Color.fromRGBO(162, 203, 189, 0.523958),
            Color(0xFFE9DAC1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(
            fillCOlor: AppColor.white,
            hintText: "Search in Store",
          ),
          SizedBox(height: 21),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/toko/${widget.id}.jpg"),
                radius: 24,
              ),
              // Image.asset("images/store_icon.png", width: 48),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toko Botol Plastik",
                    style: AppText.subtitle(color: Colors.black),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "99+ ",
                          style: AppText.desc(color: AppColor.secondary2),
                          children: [
                            TextSpan(
                              text: "Product",
                              style: AppText.desc(
                                color: AppColor.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          text: "• ",
                          style: AppText.desc(color: AppColor.secondary2),
                          children: [
                            TextSpan(
                              text: "Surabaya",
                              style: AppText.desc(
                                color: AppColor.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
