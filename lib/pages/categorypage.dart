import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadurjini_user/pages/shopproductpage.dart';
import 'package:provider/provider.dart';

import '../Models/shopmodel.dart';
import '../provider/shopprovider.dart';

class CategoryPage extends StatefulWidget {
  static const String routeName='/categorypage';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
List<String> categorylist=[];
List<dynamic> CityList=[];
String Cityid='';
List<shopmodel> ShopList = [];
late String Shopname;
late String Shopad;
class _CategoryPageState extends State<CategoryPage> {
  void initState(){
     CityList=['All Bangladesh','Dhaka','Bogra','Rajshahi'];
     setState(() {
       getdata("Dhaka");
     });
    super.initState();
  }
  String dropdownvalue = 'All Bangladesh';

// List of items in our dropdown menu
  var items = [
    'All Bangladesh',
    'Dhaka',
    'Bogra',
    'Rajshahi',
  ];
  //bool isloading=true;
  void getdata(String city)async{
   await Provider.of<ShopProvider>(context,listen: false).getShopData("/locateShops/$city");
    ShopList = Provider.of<ShopProvider>(context,listen: false).ShopList;
    //isloading=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.1,
        backgroundColor: Colors.white,
      ),
           body: SingleChildScrollView(
             child: Center(
               child: Column(
                 children: [
                   SizedBox(height: 15,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width-20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white60),
                        color: Colors.blue
                    ),
                     child:  Center(
                       child: DropdownButton(
                         value: dropdownvalue,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),
                         icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                         focusColor: Colors.blue,
                         dropdownColor: Colors.blue,
                         items: items.map((String items) {
                           return DropdownMenuItem(
                             value: items,
                             child: Text(items),
                           );
                         }).toList(),

                         onChanged: (String? newValue) {
                           setState(() {
                             dropdownvalue = newValue!;
                             getdata(dropdownvalue);
                           });
                         },
                       ),
                     ),
                  ),/*isloading?Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: CircularProgressIndicator(),
                  ):*/
                   Container(
                     height: 800,
                     child: Consumer<ShopProvider>(
                       builder: (context,provider,child){
                         return Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Container(
                             height: 300,
                             width: MediaQuery.of(context).size.width,
                             child: GridView.builder(
                                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                     maxCrossAxisExtent: 200,
                                     childAspectRatio: 3 / 2,
                                     crossAxisSpacing: 20,
                                     mainAxisSpacing: 20),
                                 itemCount: ShopList.length,
                                 itemBuilder: (context, index){
                                   return GestureDetector(
                                     onTap: (){
                                       Shopname=ShopList[index].shopName!;
                                       Shopad=ShopList[index].shopLocation!;
                                       Navigator.pushNamed(context, ShopPage.routeName);
                                     },
                                     child: Container(
                                       child: Stack(
                                         children: [
                                           Container(
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(15)
                                             ),
                                             child: ClipRRect(
                                               borderRadius: BorderRadius.circular(15),
                                               child: Image.network('${ShopList[index].shopImage}',fit: BoxFit.cover
                                                 ,),
                                             ),
                                           ),
                                           Positioned(
                                             bottom:0,
                                             child: Opacity(
                                               opacity:0.8,
                                               child: Container(
                                                 height: 65,
                                                 width: 215,
                                                 color: Colors.white,
                                               )
                                             ),
                                           ),
                                           Positioned(
                                             bottom:0,
                                             child: Column(
                                               children: [
                                                 Text('${ShopList[index].shopName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                 Row(
                                                   children: [
                                                     Icon(Icons.star,color: Colors.deepOrangeAccent,),
                                                     Text('4.5',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                                                   ],
                                                 )
                                               ],
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                   );
                                 }
                             ),
                           ),
                         );
                       },
                     )
                   ),
                 ],
               ),
             ),
           ),
    );
  }
}
