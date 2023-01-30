import 'dart:convert';


import '../Models/shopmodel.dart';
import 'package:http/http.dart' as http;

import '../utils/apilink.dart';

class CustomeHttp {
  Future<Map<String, String>> getheaderWithToken() async {
    Map<String, String> map = {
      'Accept': 'application/json',
      'Authorization': 'bearer 1031|8UzmvGgpH308JbOfRPYzsoKJUD2JMBT1fBlX9Du0'
    };

    //  print('object ${sharedPreferences.getString('token')}');
    return map;
  }

  Future<List<shopmodel>> fetchShopData(String getapi) async {
    var link = '${apilink+getapi}';

    List<shopmodel> shoplist = [];

    try {
      var respons =
      await http.get(Uri.parse(link), headers: await getheaderWithToken());

      // print('respons isss ${respons.body}');

      var data = jsonDecode(respons.body);

      shopmodel ShopModel;

      for (var i in data) {
        ShopModel = shopmodel.fromJson(i);

        shoplist.add(ShopModel);
      }

      // print("${productList[0].price}");

      return shoplist;
    } catch (e) {
      print(e.toString());
    }
    return shoplist;
  }
}
