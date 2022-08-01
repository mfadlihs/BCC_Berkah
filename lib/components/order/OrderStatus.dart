import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';

class OrderStatus extends StatelessWidget {
  final bool isDone;

  const OrderStatus({Key? key, required this.isDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isDone ? Color(0xFF4CAF50) : Color(0xFFFFC107),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        "Done",
        style: AppText.desc(color: AppColor.white),
      ),
    );
  }
}
