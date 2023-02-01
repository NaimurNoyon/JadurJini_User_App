import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cartmodel.dart';
import '../provider/cartprovider.dart';
import '../utils/colors.dart';
import 'package:http/http.dart' as http;

class ShippingAddress extends StatefulWidget {
  static const String routeName='/shippingpage';
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();

  late CartProvider cartProvider;
  late List<AddCartModel> allCarts=[];

  @override
  void didChangeDependencies() {
    cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getallCarts();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    Provider.of<CartProvider>(context,listen: false).getallCarts();
    allCarts=cartProvider.cartlist;

    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: streetAddressController,
              decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.person,color: Colors.black,),
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  labelText: 'Street Address',
                  labelStyle: TextStyle(color: Colors.black)
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: cityController,
              decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.phone,color: Colors.black,),
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  labelText: 'City',
                  labelStyle: TextStyle(color: Colors.black)
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: stateController,
              decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  labelText: 'State',
                  labelStyle: TextStyle(color: Colors.black)
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: zipController,
              decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.2)),
                  labelText: 'Zip/State',
                  labelStyle: TextStyle(color: Colors.black)
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: themeColorBlueh,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  onPressed: ()  {
                    print(allCarts[0].product_name);
                    submitOrder();
                  },
                  child:  Text(
                    'Confirm Order',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitOrder() async{
    final l = allCarts.length;
    final body = {
      "address": {
        "streetAddress": "Sontia Bazar, Jamalpur",
        "city": "Jamalpur",
        "state": "Jamalpur",
        "zip": "6213"
      },
      "cart": {
        for(var i=0; i<l; i++){
          "productName": allCarts[i].product_name,
        }
      },
    };
    //Submit data to the server
    final url = 'https://jadurjini.vercel.app/order';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'}
    );
    print(response.statusCode);
    //show success or failed message based on status
    if (response.statusCode == 200) {
      print('Creation Success');
/*      nameController.text = '';
      emailController.text = '';
      numberController.text = '';
      passwordController.text = '';*/
    }else{
      print('Creation Failed');
    }
  }


}
