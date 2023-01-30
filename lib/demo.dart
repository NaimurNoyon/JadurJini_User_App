import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jadurjini_user/provider/order_provider.dart';
import 'package:provider/provider.dart';

import 'models/order_model.dart';

class DemoPage extends StatefulWidget {
  static const String routeName='/demopage';
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<OrderModel> orderList = [];
  List<Cart> cartList = [];


  @override
  Widget build(BuildContext context) {
    var orderprovider =
    Provider.of<OrderProvider>(context).getOrderData();
    orderList = Provider.of<OrderProvider>(context).orderList;

    var cartprovider =
    Provider.of<OrderProvider>(context).getOrderData();
    cartList = Provider.of<OrderProvider>(context).orderList[0].cart!;
    return Scaffold(
      body: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index){
                  return Text("${cartList[index].productName}");
          }
      )
    );
  }
}
