import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jadurjini_user/models/product_model.dart';
import 'package:jadurjini_user/pages/categorypage.dart';
import 'package:jadurjini_user/pages/loginpage.dart';
import 'package:jadurjini_user/pages/productdetail.dart';
import 'package:jadurjini_user/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  static const String routeName='/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}
List imageList = [
  {"id": 1, "image_path": 'assets/images/offerone.jpg'},
  {"id": 2, "image_path": 'assets/images/offertwo.jpg'},
  {"id": 3, "image_path": 'assets/images/offerone.jpg'}
];

List<Map<String, dynamic>> cat = [
  {
    'cattext': 'Hoodie',
    'imagepath': 'assets/images/hoodie.png',
    'color': Colors.red
  },
  {
    'cattext': 'Tshirt',
    'imagepath': 'assets/images/itshirt.png',
    'color': Colors.deepPurple
  },
  {
    'cattext': 'Pants',
    'imagepath': 'assets/images/pant.png',
    'color': Colors.pink
  },
  {
    'cattext': 'Shoes',
    'imagepath': 'assets/images/shoe.png',
    'color': Colors.teal
  },
  {
    'cattext': 'Vegetable',
    'imagepath': 'assets/images/veg.png',
    'color': Colors.cyan
  },
  {
    'cattext': 'Foods',
    'imagepath': 'assets/images/food.png',
    'color': Colors.purple
  },
];
late ProductModel selectedproduct;
class _HomePageState extends State<HomePage> {

  List<ProductModel> productList = [];

  @override
  Widget build(BuildContext context) {




    final CarouselController carouselController = CarouselController();
    int currentIndex = 0;

    var productprovider =
    Provider.of<ProductProvider>(context).getProductData();
    productList = Provider.of<ProductProvider>(context).productList;
    double screensize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: PopupMenuButton(
            icon: Icon(Icons.menu,size: 30,color: Colors.black,),
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: TextButton(
                      onPressed: null,
                      child: Text('Profile',style: TextStyle(fontSize: 17,color: Colors.black),),
                  ),
                ),

                PopupMenuItem<int>(
                  value: 1,
                  child: TextButton(
                    onPressed: null,
                    child: Text('Settings',style: TextStyle(fontSize: 17,color: Colors.black),),
                  ),
                ),

                PopupMenuItem<int>(
                  value: 2,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, LoginPage.routeName);
                    },
                    child: Text('Login',style: TextStyle(fontSize: 17,color: Colors.black),),
                  )
                ),
              ];
            },
            onSelected:(value){
              if(value == 0){
                print("Profile menu is selected.");
              }else if(value == 1){
                print("Settings menu is selected.");
              }else if(value == 2){
                print("LogIn menu is selected.");
              }
            }
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.location_on,size: 20,color: Colors.black,),
            Text(
              'New Market, Rajshahi',
              style: TextStyle(fontSize: 17,color: Colors.black),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.shopping_bag,color: Colors.black,),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/offersix.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/offerseven.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/offereight.jpg"),
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Explore by category",
                style: TextStyle(
                  fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              height: 90,
              child: Consumer<ProductProvider>(
                  builder: (context,provider,child){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: cat[index]['color'].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(width: 2, color: cat[index]['color'].withOpacity(0.7))),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: screensize * 0.12,
                                  width: screensize * 0.15,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(cat[index]['imagepath']))),
                                ),
                              ),
                              onTap: (){
                                Navigator.pushNamed(context, CategoryPage.routeName);
                              },
                            ),
                            Text(cat[index]['cattext'],style: TextStyle(color: cat[index]['color'],fontSize: 15)),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemCount: cat.length),
              );}),
    ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Order Again",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0.5,
                                  spreadRadius: 0.1
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Row(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                              child: Image.network(
                                  '${productList[index].productImage}',
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover
                              ),
                            ),
                            SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Text('${productList[index].productName}',
                                    style:TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Text('BDT - ${productList[index].productPrice} tk',
                                    style:TextStyle(
                                      fontSize: 16,
                                    ),),
                                ),
                                SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${productList[index].shopName}',
                                        style:TextStyle(
                                          fontSize: 14,
                                        ),),
                                      SizedBox(width: 2,),
                                      Icon(Icons.verified,color: Colors.blue,size: 14,)
                                    ],
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    );
                  },
                 separatorBuilder: (context, index) => SizedBox(
                width: 10,),
                itemCount: productList.length,
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Offers",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/offersix.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: false,
                aspectRatio: 2,
                viewportFraction: 1,
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Recommendations",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 260

                ),
              shrinkWrap: true,
                itemCount: productList.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        selectedproduct=productList[index];
                        Navigator.pushNamed(context, ProductDetailPage.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.2,
                              spreadRadius: 0.1
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              child: Image.network(
                                  '${productList[index].productImage}',
                                  height: 120,
                                  fit: BoxFit.cover
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${productList[index].productName}',
                                    style:TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.amber[600]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text('${productList[index].productRating}',
                                              style:TextStyle(
                                                color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            Icon(Icons.star,size: 14,color: Colors.white,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('${productList[index].productCategory}',
                                style:TextStyle(
                                    fontSize: 14,
                                  color: Colors.black26
                                ),),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('BDT - ${productList[index].productPrice} tk',
                                style:TextStyle(
                                    fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${productList[index].shopName}',
                                    style:TextStyle(
                                      fontSize: 14,
                                    ),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.verified,size: 20,color: Colors.blue,),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                }
            )
          ]),
      ),
    );
  }
}
