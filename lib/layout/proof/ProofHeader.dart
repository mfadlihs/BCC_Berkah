import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProofHeader extends StatelessWidget {
  const ProofHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: CircleBorder(),
            padding: EdgeInsets.all(8),
          ),
          child: Icon(
            Icons.navigate_before,
          ),
        ),
        SizedBox(width: 8),
        Text("Payment", style: AppText.subheader()),
      ],
    );
  }
}
