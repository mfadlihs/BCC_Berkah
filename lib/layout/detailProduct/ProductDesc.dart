import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';

class ProductDescription extends StatelessWidget {
  String desc;
  ProductDescription({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: AppText.subheader(),
          ),
          SizedBox(height: 8),
          Text(
            desc,
            style: AppText.subtitle(
              lineHeight: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
