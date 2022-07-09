import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: AppColor.secondary1, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("images/store_icon.png"),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Toko Botol Plastik",
                      style: AppText.subtitle(),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "99+ ",
                            style: AppText.desc(color: AppColor.primary),
                            children: [
                              TextSpan(
                                text: "Product",
                                style: AppText.desc(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        RichText(
                          text: TextSpan(
                            text: "• ",
                            style: AppText.desc(color: AppColor.primary),
                            children: [
                              TextSpan(
                                text: "Surabaya",
                                style: AppText.desc(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Text(
                "Visit",
                style: AppText.subtitle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
