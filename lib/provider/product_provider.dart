import 'package:flutter/material.dart';
import '../helper/helper.dart';
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];
  List<ProductModel> productListbyshop = [];
  List<ProductModel> productListbyshopbycat = [];

  Future getProductData() async {
    productList = await CustomeHttp().fetchProductData();
    notifyListeners();
  }
  void getthisshopproduct(String shopname)
  {
    int i=0,j=0; bool alreadyin=false;
    for(i=0;i<productList.length;i++)
      {
        if(productList[i].shopName==shopname)
          {
            for(j=0;j<productListbyshop.length;j++)
            {
              if(productList[i].productName==productListbyshop[j].productName)
                alreadyin=true;
            }
            alreadyin? null:productListbyshop.add(productList[i]);
          }
      }
  }

  void getthisshopproductbycat(String cat)
  {
    int i=0,j=0; bool alreadyin=false;
    for(i=0;i<productListbyshop.length;i++)
    {
      if(productListbyshop[i].productCategory==cat)
      {
        for(j=0;j<productListbyshopbycat.length;j++)
        {
          if(productListbyshop[i].productName==productListbyshopbycat[j].productName)
            alreadyin=true;
        }
        alreadyin? null:productListbyshopbycat.add(productListbyshop[i]);
      }
    }
  }
}