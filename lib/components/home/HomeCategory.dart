import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';

class HomeCategory extends StatelessWidget {
  final String content;

  const HomeCategory({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(width: 1, color: AppColor.primary),
      ),
      child: Text(
        content,
        style: AppText.desc(color: AppColor.textPrimary),
      ),
    );
  }
}
