import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';

class CategoryButton extends StatefulWidget {
  CategoryButton({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColor.primary,
            width: 1,
          )),
      child: widget.content,
    );
  }
}
