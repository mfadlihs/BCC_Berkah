import 'package:bcc/components/Navbar.dart';
import 'package:bcc/components/order/OrderCard.dart';
import 'package:bcc/layout/waitingPayment/waitingHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingPaymentScreen extends StatefulWidget {
  WaitingPaymentScreen({Key? key}) : super(key: key);

  @override
  State<WaitingPaymentScreen> createState() => _WaitingPaymentScreenState();
}

class _WaitingPaymentScreenState extends State<WaitingPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 20),
                WaitingHeader(),
                SizedBox(height: 20),
                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
