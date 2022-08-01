import 'package:bcc/Function/getRoute.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navbar extends StatefulWidget {
  int index;
  Navbar({Key? key, this.index = 0}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var Kotak = Container(
    width: 20,
    margin: EdgeInsets.only(top: 3),
    height: 3,
    decoration: BoxDecoration(
      color: AppColor.textPrimary,
      borderRadius: BorderRadius.circular(20),
    ),
  );

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
          // Basket
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
                onPressed: () {
                  if (getRoute(context) != "/basket") {
                    Navigator.pushNamed(context, "/basket");
                  }
                },
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
              // Home
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {
                  if (getRoute(context) != "/") {
                    Navigator.pushNamed(context, "/");
                  }
                },
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    widget.index == 1
                        ? Kotak
                        : Text(
                            "Home",
                            style: AppText.body(color: AppColor.textPrimary),
                          ),
                  ],
                ),
              ),

              // Orders
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {
                  if (getRoute(context) != "/orders") {
                    Navigator.pushNamed(context, "/orders");
                  }
                },
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.assignment),
                    widget.index == 2
                        ? Kotak
                        : Text(
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

              // Whislist
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {
                  if (getRoute(context) != "/wishlist") {
                    Navigator.pushNamed(context, "/wishlist");
                  }
                },
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite),
                    widget.index == 3
                        ? Kotak
                        : Text(
                            "Wishlist",
                            style: AppText.body(color: AppColor.textPrimary),
                          ),
                  ],
                ),
              ),

              // Profile
              MaterialButton(
                shape: CircleBorder(),
                onPressed: () {
                  if (getRoute(context) != "/profile") {
                    Navigator.pushNamed(context, "/profile");
                  }
                },
                minWidth: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    widget.index == 4
                        ? Kotak
                        : Text(
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
