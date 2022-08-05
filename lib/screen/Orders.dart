import 'package:bcc/components/Navbar.dart';
import 'package:bcc/components/order/OrderCard.dart';
import 'package:bcc/layout/order/OrderHeader.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/providers/ProviderOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    // var providerOrder = Provider.of<ProviderOrder>(context, listen: false);
    var providerOrder = Provider.of<ProviderOrder>(context, listen: false);

    // var listProduct = Provider.of<ListProduct>(context, listen: false);

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
                ...providerOrder.data
                    .map((e) => OrderCard(e.product, e.amount))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(index: 2),
    );
  }
}
