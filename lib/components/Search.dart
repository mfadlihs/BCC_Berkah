import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Color? fillCOlor = AppColor.tertiary;
  final String hintText;
  Search({Key? key, this.fillCOlor, required this.hintText}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppText.body(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: widget.fillCOlor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 13,
        ),
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintStyle: TextStyle(color: AppColor.textSecondary),
      ),
    );
  }
}
