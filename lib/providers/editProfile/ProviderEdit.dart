import 'dart:io';

import 'package:flutter/material.dart';

class EditProfileState extends ChangeNotifier {
  File? image;

  void addImage(File image) {
    this.image = image;
    notifyListeners();
  }

  void deleteImage() {
    image = null;
    notifyListeners();
  }
}
