import 'package:flutter/material.dart';

showNotif(String text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
      elevation: 1000,
    ),
  );
}
