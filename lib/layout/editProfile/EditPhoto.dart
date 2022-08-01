import 'dart:io';

import 'package:bcc/providers/editProfile/ProviderEdit.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditPhoto extends StatefulWidget {
  EditPhoto({Key? key}) : super(key: key);

  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  bool isAvailable = true;
  File? image;

  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<EditProfileState>(context, listen: false);

    Future pickImage() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) {
          return;
        }

        final tempImage = File(image.path);

        setState(() {
          this.image = tempImage;
          isAvailable = false;
        });

        imageProvider.addImage(tempImage);
      } catch (e) {}
    }

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: image == null
              ? Image.asset(
                  "images/default_pp.jpg",
                  width: 72,
                )
              : Image.file(
                  image!,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                side: BorderSide(
                  color: AppColor.primary,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                pickImage();
              },
              child: Text(
                'Upload Photo',
                style: AppText.subtitle(),
              ),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                side: BorderSide(
                  color:
                      isAvailable ? AppColor.textSecondary : AppColor.primary,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: image == null
                  ? null
                  : () {
                      imageProvider.deleteImage();
                      setState(() {
                        image = null;
                        isAvailable = true;
                      });
                    },
              child: Text(
                'Delete Photo',
                style: AppText.subtitle(
                  color: isAvailable
                      ? AppColor.textSecondary
                      : AppColor.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
