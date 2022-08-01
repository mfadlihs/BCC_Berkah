import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileHeader extends StatefulWidget {
  EditProfileHeader({Key? key}) : super(key: key);

  @override
  State<EditProfileHeader> createState() => _EditProfileHeaderState();
}

class _EditProfileHeaderState extends State<EditProfileHeader> {
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
        Text("Edit Profile", style: AppText.subheader()),
      ],
    );
  }
}
