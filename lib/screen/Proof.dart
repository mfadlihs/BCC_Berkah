import 'dart:io';

import 'package:bcc/components/PaymentNav2.dart';
import 'package:bcc/components/PaymentNav3.dart';
import 'package:bcc/layout/payment/CardPayment.dart';
import 'package:bcc/layout/proof/ProofHeader.dart';
import 'package:bcc/layout/proof/ProofUpload.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProofScreen extends StatefulWidget {
  ProofScreen({Key? key}) : super(key: key);

  @override
  State<ProofScreen> createState() => _ProofScreenState();
}

class _ProofScreenState extends State<ProofScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              ProofHeader(),
              CardPayment(),
              Divider(
                color: AppColor.secondary1,
                thickness: 1,
              ),
              ProofUpload(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PaymentNav3(),
    );
  }
}
