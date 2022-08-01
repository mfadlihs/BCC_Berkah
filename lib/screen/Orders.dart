import 'package:bcc/components/Navbar.dart';
import 'package:bcc/components/order/OrderCard.dart';
import 'package:bcc/layout/order/OrderHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                SizedBox(height: 20),
                OrderHeader(),
                SizedBox(height: 16),
                OrderCard(),
                OrderCard(),
                OrderCard(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(index: 2),
    );
  }
}
