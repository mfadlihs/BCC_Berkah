import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

showNotif(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
      elevation: 1000,
    ),
  );
}

showAlert(String text, BuildContext context, {bool isFalse = false}) {
  if (isFalse) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(message: text),
    );
  }

  return showTopSnackBar(
    context,
    CustomSnackBar.success(message: text),
  );
}
