import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColor.secondary1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Center(
              child: MaterialButton(
                color: AppColor.primary,
                padding: EdgeInsets.all(28),
                shape: CircleBorder(
                  side: BorderSide(
                    color: AppColor.white,
                    width: 10,
                  ),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.shopping_basket,
                  size: 32,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {},
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    Text(
                      "Home",
                      style: AppText.body(color: AppColor.textPrimary),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {},
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.assignment),
                    Text(
                      "Orders",
                      style: AppText.body(color: AppColor.textPrimary),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 45,
                    width: 60,
                  ),
                  Text(
                    "Basket",
                    style: AppText.body(),
                  ),
                ],
              ),
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {},
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite),
                    Text(
                      "Whislist",
                      style: AppText.body(color: AppColor.textPrimary),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {},
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    Text(
                      "Profile",
                      style: AppText.body(color: AppColor.textPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MidButton extends StatelessWidget {
  const MidButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      left: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("wkwkw"),
      ),
    );
  }
}
