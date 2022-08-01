import 'package:bcc/components/Delivery.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => PaymentMethodState();
}

class PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Delivery();
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.delivery_dining),
                    SizedBox(width: 9),
                    Text(
                      "Choose Delivery",
                      style: AppText.subtitle(),
                    ),
                  ],
                ),
                Icon(
                  Icons.navigate_next,
                  color: AppColor.secondary2,
                  size: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/coupons');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Icon(Icons.store_mall_directory),
                    Icon(Icons.local_activity),
                    SizedBox(width: 9),
                    Text(
                      "Choose Coupons",
                      style: AppText.subtitle(),
                    ),
                  ],
                ),
                Icon(
                  Icons.navigate_next,
                  color: AppColor.secondary2,
                  size: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/payment-method');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_activity),
                    SizedBox(width: 9),
                    Text(
                      "Payment Methods",
                      style: AppText.subtitle(),
                    ),
                  ],
                ),
                Icon(
                  Icons.navigate_next,
                  color: AppColor.secondary2,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
