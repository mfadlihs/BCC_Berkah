import 'package:bcc/components/order/OrderStatus.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  OrderCard({Key? key}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  // var doneStatus = Container(
  //   padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
  // );

  Widget doneStatus() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.white,
        border: Border.all(
          width: 1,
          color: AppColor.primary,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 6,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2 Juli 2022",
                style: AppText.desc(color: Colors.black),
              ),
              OrderStatus(
                isDone: true,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColor.gray,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "images/product_icon.png",
                  width: 42,
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biji Plastik 25 kg",
                    style: AppText.subtitle(),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "1 item",
                    style: AppText.desc(),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: AppText.desc(),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Rp 625.000",
                    style: AppText.subtitle(),
                  ),
                ],
              ),
              ClipRRect(
                // borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Again",
                    style: AppText.subtitle(),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
