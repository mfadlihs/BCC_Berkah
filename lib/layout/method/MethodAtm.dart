import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';

class MethodAtm extends StatelessWidget {
  MethodAtm({Key? key}) : super(key: key);

  List<String> text = [
    "Visit the nearest ATM, then enter the ATM card and PIN",
    "In the main menu, select Other Transactions, then select Transfer. Enter the Total Payment according to your order",
    'Enter the "GAMA APP" account number according to the destination bank',
    'After successful, you will get a transfer receipt',
    'Save the transfer receipt, then take a photo and upload it on the available page',
    'Wait for your payment to be verified',
    'Once verified, you have made the payment successfully',
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
            "ATM Transfer",
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

class OrderedList extends StatelessWidget {
  final int number;
  final String text;

  OrderedList({Key? key, required this.number, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$number. ",
          style: AppText.body(),
        ),
        Expanded(
          child: Text(
            text,
            style: AppText.body(),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

/*
Visit the nearest ATM, then enter the ATM card and PIN
In the main menu, select Other Transactions, then select Transfer. Enter the Total Payment according to your order
Enter the "GAMA APP" account number according to the destination bank
After successful, you will get a transfer receipt
Save the transfer receipt, then take a photo and upload it on the available page
Wait for your payment to be verified
Once verified, you have made the payment successfully
 */
