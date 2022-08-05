import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultPhoto extends StatelessWidget {
  const DefaultPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      color: Colors.grey[300],
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
