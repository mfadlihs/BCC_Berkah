import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddProductHeader extends StatelessWidget {
  const AddProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: CircleBorder(),
            padding: EdgeInsets.all(8),
          ),
          child: Icon(
            Icons.navigate_before,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "Add Product",
          style: AppText.subheader(),
        ),
      ],
    );
  }
}
