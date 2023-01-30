import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadurjini_user/pages/categorypage.dart';
import 'package:jadurjini_user/pages/first_page.dart';
import 'package:jadurjini_user/pages/productdetail.dart';
import 'package:jadurjini_user/pages/shopscatproductspage.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../provider/product_provider.dart';
import 'home_page.dart';

class ShopPage extends StatefulWidget {
  static const String routename='/shoppage';
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}
late String shopcat;
class _ShopPageState extends State<ShopPage> {
  List<ProductModel> shopproductList = [];

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context).getthisshopproduct(Shopname);
    shopproductList = Provider.of<ProductProvider>(context).productListbyshop;
    double screensize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pushReplacementNamed(context, CategoryPage.routeName);}, icon: Icon(Icons.keyboard_backspace_sharp,color: Colors.black,size: 30,)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag,color: Colors.black,size: 30,))
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
Text(Shopname,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: 6,),
              Text(Shopad,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
              SizedBox(height: 6,),
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/offerone.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/offerthree.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/offerfour.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 175.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(height: 12,),
              Container(
                height: 120,
                child: Consumer<ProductProvider>(
                    builder: (context,provider,child){
                      return
                        ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: cat[index]['color'].withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          width: 2, color: cat[index]['color'].withOpacity(0.7))),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: screensize * 0.28,
                                          height: screensize * 0.22,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(cat[index]['imagepath']))),
                                        ),
                                        onTap: (){
                                          // cat[index]['cattext']=='Tshirt' || cat[index]['cattext']=='Pant'||
                                          //     cat[index]['cattext']=='Pants'||
                                          //     cat[index]['cattext']=='Hoodie'||
                                          //     cat[index]['cattext']=='Shoes'
                                          //     ? shopcat='Fashion': shopcat='Food';
                                          shopcat='Fashion';


                                          Navigator.pushNamed(context, ShopsCatProPage.routename);
                                        },
                                      ),
                                      Text(cat[index]['cattext'],style: TextStyle(color: cat[index]['color'],fontSize: 15)),

                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                            itemCount: cat.length);}),
              ),
              SizedBox(height: 12,),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 200

                  ),
                  shrinkWrap: true,
                  itemCount: shopproductList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          selectedproduct=shopproductList[index];
                          selectedproduct=shopproductList[index];
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
                                    '${shopproductList[index].productImage}',
                                    height: 120,
                                    fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${shopproductList[index].productName}',
                                style:TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(height: 5),
                              Text('${shopproductList[index].productPrice} tk',
                                style:TextStyle(
                                  fontSize: 18,
                                ),),

                            ],
                          ),
                        ),
                      ),
                    );
                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}
