import 'dart:io';

import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProofUpload extends StatefulWidget {
  ProofUpload({Key? key}) : super(key: key);

  @override
  State<ProofUpload> createState() => _ProofUploadState();
}

class _ProofUploadState extends State<ProofUpload> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final tempImage = File(image.path);

      setState(() {
        this.image = tempImage;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Please upload proof of payment here!",
            style: AppText.subheader(),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: pickImage,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.tertiary,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.upload,
                    size: 14,
                    color: AppColor.textSecondary,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Upload proof of payment',
                    style: AppText.body(color: AppColor.textSecondary),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          image == null
              ? Text("no upload")
              : Image.file(
                  image!,
                  width: double.infinity,
                  height: 500,
                  fit: BoxFit.cover,
                ),
        ],
      ),
    );
  }
}


/*
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
*/