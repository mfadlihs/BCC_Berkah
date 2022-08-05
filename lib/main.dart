import 'package:bcc/layout/profile/PaymentMethod.dart';
import 'package:bcc/layout/signin/SignInBox.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/providers/ProviderBasket.dart';
import 'package:bcc/providers/ProviderDelivery.dart';
import 'package:bcc/providers/ProviderDetail.dart';
import 'package:bcc/providers/ProviderOrder.dart';
import 'package:bcc/providers/editProfile/ProviderEdit.dart';
import 'package:bcc/screen/AddProduct.dart';
import 'package:bcc/screen/Basket.dart';
import 'package:bcc/screen/Coupons.dart';
import 'package:bcc/screen/DetailProduct.dart';
import 'package:bcc/screen/DetailStore.dart';
import 'package:bcc/screen/EditProfile.dart';
import 'package:bcc/screen/Home.dart';
import 'package:bcc/screen/Method.dart';
import 'package:bcc/screen/Landing.dart';
import 'package:bcc/screen/Orders.dart';
import 'package:bcc/screen/Payment.dart';
import 'package:bcc/screen/Profile.dart';
import 'package:bcc/screen/Proof.dart';
import 'package:bcc/screen/SeeAll.dart';
import 'package:bcc/screen/SignIn.dart';
import 'package:bcc/screen/SignUp.dart';
import 'package:bcc/screen/Splash.dart';
import 'package:bcc/screen/SuccessVerification.dart';
import 'package:bcc/screen/WaitingVerification.dart';
import 'package:bcc/screen/Whislist.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/GlobalTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<EditProfileState>(
        create: (context) => EditProfileState(),
      ),
      ChangeNotifierProvider<ListProduct>(
        create: (context) => ListProduct(),
      ),
      ChangeNotifierProvider<ProviderDetail>(
        create: (context) => ProviderDetail(),
      ),
      ChangeNotifierProvider<ProviderBasket>(
        create: (context) => ProviderBasket(),
      ),
      ChangeNotifierProvider<ProviderOrder>(
        create: (context) => ProviderOrder(),
      ),
      ChangeNotifierProvider<ProviderDelivery>(
        create: (context) => ProviderDelivery(),
      )
    ], child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/login': (context) => SigninScreen(),
        '/register': (context) => SignUpScreen(),
        '/': (context) => HomeScreen(),
        '/splash': (context) => SplashScreen(),
        '/landing': (context) => LandingScreen(),
        '/detail-product': (context) => DetailProductScreen(),
        '/detail-store': (context) => DetailStore(),
        '/see-all': (context) => SeeAllScreen(),
        '/orders': (context) => OrderScreen(),
        '/wishlist': (context) => WishListScreen(),
        '/profile': (context) => ProfileScreen(),
        '/edit-profile': (context) => EditProfileScreen(),
        '/add-product': (context) => AddProduct(),
        '/basket': (context) => BasketScreen(),
        '/payment': (context) => PaymentScreen(),
        '/coupons': (context) => CouponScreen(),
        '/payment-method': (context) => MethodScreen(),
        '/payment-proof': (context) => ProofScreen(),
        '/waiting-verification': (context) => WaitingVerificationScreen(),
        '/success-verification': (context) => SuccessVerification(),
      },
    );
  }
}
