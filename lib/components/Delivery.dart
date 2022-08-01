import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => DeliveryState();
}

class DeliveryState extends State<Delivery> {
  bool isReguler = false;
  bool isKargo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.textPrimary,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4,
                  color: Color(0xFF263238),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Delivery",
                style: AppText.subheader(),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    if (isKargo) {
                      isKargo = false;
                    }
                    isReguler = isReguler ? false : true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: isReguler ? Colors.grey[200] : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reguler (Rp 22.000)",
                        style: AppText.subtitle(),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Estimasi tiba 4 - 14 July",
                        style: AppText.body(
                          color: AppColor.textSecondary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    if (isReguler) {
                      isReguler = false;
                    }
                    // isKargo = !isKargo;
                    isKargo = isKargo ? false : true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  // color: Colors.grey[200],
                  color: isKargo ? Colors.grey[200] : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kargo (Rp 50.000)",
                        style: AppText.subtitle(),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Estimasi tiba 4 - 14 July\nRekomendasi berat di atas 5kg",
                        style: AppText.body(
                          color: AppColor.textSecondary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
