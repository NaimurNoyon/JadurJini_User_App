import 'package:flutter/material.dart';
import '../helper/helper.dart';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];

  Future getOrderData() async {
    orderList = await CustomeHttp().fetchOrderData();
    notifyListeners();
  }
}