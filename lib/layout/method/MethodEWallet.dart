import 'package:bcc/layout/method/MethodAtm.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';

class MethodEWallet extends StatelessWidget {
  MethodEWallet({Key? key}) : super(key: key);

  final List<String> text = [
    'E-banking access via computer or smartphone',
    'Select the Transfer menu, then enter the Total Payment after your order',
    'Enter the "GAMA APP" account number according to the destination bank',
    'After successful, you will get an E-receipt proof of transfer',
    'Save the transfer proof E-receipt (screenshot), then please upload it on the available page',
    'Wait for your payment to be verified',
    'Once verified, you have made the payment successfully'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColor.primary,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "E-Banking",
            style: AppText.subheader(),
          ),
          SizedBox(height: 4),
          ...text
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  OrderedList(
                    number: key + 1,
                    text: value,
                  ),
                ),
              )
              .values
              .toList(),
        ],
      ),
    );
  }
}

/*

E-banking access via computer or smartphone
Select the Transfer menu, then enter the Total Payment after your order
Enter the "GAMA APP" account number according to the destination bank
After successful, you will get an E-receipt proof of transfer
Save the transfer proof E-receipt (screenshot), then please upload it on the available page
Wait for your payment to be verified
Once verified, you have made the payment successfully
*/