import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadurjini_user/pages/productdetail.dart';
import 'package:jadurjini_user/pages/shopproductpage.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../provider/product_provider.dart';
import 'home_page.dart';

class ShopsCatProPage extends StatefulWidget {
  static const String routeName='/shopsproductbycat';
  const ShopsCatProPage({Key? key}) : super(key: key);

  @override
  State<ShopsCatProPage> createState() => _ShopsCatProPageState();
}
List<ProductModel> catshopproductList = [];
class _ShopsCatProPageState extends State<ShopsCatProPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context).getthisshopproductbycat(shopcat);
    catshopproductList = Provider.of<ProductProvider>(context).productListbyshopbycat;
    double screensize = MediaQuery.of(context).size.width;
    shopcat='';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pushReplacementNamed(context, ShopPage.routeName);}, icon: Icon(Icons.keyboard_backspace_sharp,color: Colors.black,size: 30,)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag,color: Colors.black,size: 30,))
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                mainAxisExtent: 200

            ),
            shrinkWrap: true,
            itemCount: catshopproductList.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    //selectedproduct=catshopproductList[index];
                    Navigator.pushNamed(context, ProductDetailPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.network(
                              '${catshopproductList[index].productImage}',
                              height: 120,
                              fit: BoxFit.cover
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('${catshopproductList[index].productName}',
                          style:TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 5),
                        Text('${catshopproductList[index].productPrice} tk',
                          style:TextStyle(
                            fontSize: 18,
                          ),),

                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
