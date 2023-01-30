import 'package:flutter/material.dart';
import '../Models/shopmodel.dart';
import 'helper.dart';

class ShopProvider with ChangeNotifier {
  List<shopmodel> ShopList = [];
  List<shopmodel> CategorisedShopList = [];

  Future getShopData(String passlink) async {
    ShopList = await CustomeHttp().fetchShopData(passlink);
    notifyListeners();
  }
  int i=0;
  void getcategorisedshop(String cat){
    for(i=0;i<ShopList.length;i++)
      {
        if(ShopList[i].productCategory==cat)
          {
            CategorisedShopList.add(ShopList[i]);
          }
      }
  }
}