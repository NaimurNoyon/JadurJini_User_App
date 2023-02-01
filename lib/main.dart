import 'package:flutter/material.dart';
import 'package:jadurjini_user/pages/activity_page.dart';
import 'package:jadurjini_user/pages/cartpage.dart';
import 'package:jadurjini_user/pages/categorypage.dart';
import 'package:jadurjini_user/pages/first_page.dart';
import 'package:jadurjini_user/pages/home_page.dart';
import 'package:jadurjini_user/pages/loginpage.dart';
import 'package:jadurjini_user/pages/productdetail.dart';
import 'package:jadurjini_user/pages/profilepage.dart';
import 'package:jadurjini_user/pages/shipping_address.dart';
import 'package:jadurjini_user/pages/shopproductpage.dart';
import 'package:jadurjini_user/pages/shopscatproductspage.dart';
import 'package:jadurjini_user/pages/signuppage.dart';
import 'package:jadurjini_user/provider/cartprovider.dart';
import 'package:jadurjini_user/provider/order_provider.dart';
import 'package:jadurjini_user/provider/product_provider.dart';
import 'package:jadurjini_user/provider/shopprovider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShopProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider()..getallCarts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        ),
        initialRoute: FirstPage.routeName,
        routes: {
          FirstPage.routeName: (context)=>FirstPage(),
          HomePage.routeName: (context)=>HomePage(),
          ActivityPage.routeName: (context)=>ActivityPage(),
          ProfilePage.routeName: (context)=>ProfilePage(),
          DemoPage.routeName: (context)=>DemoPage(),
          LoginPage.routeName: (context)=>LoginPage(),
          SignUpPage.routeName: (context)=>SignUpPage(),
          CategoryPage.routeName: (context)=>CategoryPage(),
          ProductDetailPage.routeName: (context)=>ProductDetailPage(),
          ShopPage.routeName: (context)=>ShopPage(),
          ShopsCatProPage.routeName: (context)=>ShopsCatProPage(),
          CartPage.routeName: (context)=>CartPage(),
          ShippingAddress.routeName: (context)=>ShippingAddress(),
        },
      ),
    );
  }
}
