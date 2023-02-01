import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadurjini_user/models/cartmodel.dart';
import 'package:jadurjini_user/models/product_model.dart';
import 'package:jadurjini_user/pages/cartpage.dart';
import 'package:jadurjini_user/provider/cartprovider.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import 'home_page.dart';

class ProductDetailPage extends StatefulWidget {
  static const String routeName='/productdetailpage';
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color sizeselectboxcol1=Colors.black54;
  Color sizeselectboxcol2=Colors.black54;
  Color sizeselectboxcol3=Colors.black54;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, CartPage.routeName);
          }, icon: Icon(Icons.shopping_bag,color: Colors.black,size: 30,))
        ],
      ),
      body:Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(selectedproduct.productImage!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('${selectedproduct.productCategory}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w200)),
                            Text('${selectedproduct.productName}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.amber),),
                                Text('${selectedproduct.productRating}'),
                              ],
                            ),
                            Text('BDT ${selectedproduct.productPrice}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('Size',style: TextStyle(fontSize: 17),),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: sizeselectboxcol1
                              ,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.horizontal(
                                      left: Radius.circular(10),
                                      right: Radius.circular(0))
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                sizeselectboxcol1=Colors.blueAccent;
                                sizeselectboxcol2=Colors.black54;
                                sizeselectboxcol3=Colors.black54;

                              });
                            },
                            child: Text('M',style: TextStyle(fontSize: 17),)
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: sizeselectboxcol2
                              ,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.horizontal(
                                      left: Radius.circular(0),
                                      right: Radius.circular(0))
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                sizeselectboxcol1=Colors.black54;
                                sizeselectboxcol2=Colors.blueAccent;
                                sizeselectboxcol3=Colors.black54;

                              });
                            },
                            child: Text('L',style: TextStyle(fontSize: 17))
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: sizeselectboxcol3
                              ,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.horizontal(
                                      left: Radius.circular(0),
                                      right: Radius.circular(10))
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                sizeselectboxcol1=Colors.black54;
                                sizeselectboxcol2=Colors.black54;
                                sizeselectboxcol3=Colors.blueAccent;
                              });
                            },
                            child: Text('XL',style: TextStyle(fontSize: 17))
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('Description:',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text('${selectedproduct.productDescription}',style: TextStyle(fontSize: 20),)

                  ],
                ),
              ),
            ),
            Positioned(
               bottom: 0.1,
                width: MediaQuery.of(context).size.width,
                height: 90,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined,size: 26,))
                        ,
                        Row(
                          children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20))),
                                  onPressed: () {
                                      addtocart();
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                          colors: [cartbutcol1!, cartbutcol2],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 140,
                                      child:Text('ADD TO CART',style: TextStyle(fontSize: 20),) ,
                                    ),
                                  ),
                                ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: (){},
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [buybutcol1!, buybutcol2],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 110,
                                  child:Text('BUY NOW',style: TextStyle(fontSize: 20),) ,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ]

      ),
    );
  }
 void addtocart() async{
   final cart = AddCartModel(
     product_name:selectedproduct.productName!,
     price: selectedproduct.productPrice!,
     size: selectedproduct.productSize!,
     image: selectedproduct.productImage!,
     quantity: 0,
     totalprice: 0,

   );
   print(cart.toString());
   final status = await Provider
       .of<CartProvider>(context, listen: false).addcart(cart);
   if(status){
     print('Succesfuly Added Question No: ');
   }
 }
}
