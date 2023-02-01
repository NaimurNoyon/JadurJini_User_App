
import 'package:flutter/material.dart';
import 'package:jadurjini_user/pages/first_page.dart';
import 'package:jadurjini_user/pages/shipping_address.dart';
import 'package:jadurjini_user/provider/cartprovider.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class CartPage extends StatefulWidget {
  static const String routeName='/cartpage';
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}
//late CartProvider provider;
bool isFirst = true;
class _CartPageState extends State<CartPage> {
  late CartProvider cp;
  int subtotal=0;
  int total=0;
  @override
  void didChangeDependencies() {
    cp = Provider.of<CartProvider>(context);
    cp.getallCarts();
    subtotal=cp.getsubtotal();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context,listen: false).getallCarts();
    double sch=MediaQuery.of(context).size.height;
    double scw=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pushReplacementNamed(context, FirstPage.routeName);}, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,size: 30,)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Syed Mahiuddin',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: sch-240,
              width: scw-40,
              child: Consumer<CartProvider>(
                builder: (context, provider, _) => ListView.builder(
                itemCount: provider.cartlist.length,
                itemBuilder: (context, index) {
              final cart = provider.cartlist[index];
              return Container(
                height: sch/4,
                width: scw-40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                        child: Image.network(provider.cartlist[index].image,height: sch/6,width: scw/2-40,fit: BoxFit.cover,)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${provider.cartlist[index].product_name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(height: 5,),
                        Text('BDT ${provider.cartlist[index].price}',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15)),
                        SizedBox(height: 5,),
                        Text('Size ${provider.cartlist[index].size}',style: TextStyle(fontSize: 15)),
                        SizedBox(height: 5,),
                        Text('Price ${provider.cartlist[index].quantity*provider.cartlist[index].price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          setState(() {
                            int q=provider.cartlist[index].quantity;
                            q++;
                            provider.updatecartquantity(index+1, q);
                            provider.updatecartprice(index+1, q*provider.cartlist[index].price);
                          });
                        }, child: Text('+',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w800),)),
                        TextButton(onPressed: (){}, child: Text('${provider.cartlist[index].quantity}',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w200),)),
                        TextButton(onPressed: (){
                          setState(() {
                            int q=provider.cartlist[index].quantity;
                            if(q!=0)
                              q--;
                            provider.updatecartquantity(index+1, q);
                            int price=(provider.cartlist[index].totalprice-provider.cartlist[index].price).round();
                            provider.updatecartprice(index+1,price );

                          });
                        }, child:
                        Text('-',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w800),))
                      ],
                    )
                  ],
                ),
              );
                })),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SubTotal',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text('Shipping',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Text('Total',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('BDT $subtotal',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Text('BDT 100',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Text('BDT ${subtotal+100}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: (){
                  Navigator.pushNamed(context, ShippingAddress.routeName);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                        colors: [buybutcol1!, buybutcol2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: scw-120,
                    child:Text('BUY NOW',style: TextStyle(fontSize: 20),) ,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
