import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName='/signuppage';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
final emailController = TextEditingController();
final passwordController = TextEditingController();
final nameController = TextEditingController();
final numberController = TextEditingController();
String dont="Already have an account";
bool visiblepass=false;
class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double scheight= MediaQuery.of(context).size.height;
    double scwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.1,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset('assets/images/logimage.png',height: 350,width: 400,),
                TextFormField(
                  controller: emailController,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.black,),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: emailController,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.phone,color: Colors.black,),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: emailController,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: passwordController,
                  obscureText: !visiblepass,
                  decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.2)),
                      suffixIcon: visiblepass?IconButton(onPressed: (){
                        setState(() {
                          visiblepass? visiblepass=false: visiblepass=true;
                        });}, icon: Icon(Icons.visibility,color: Colors.black)):
                      IconButton(onPressed: (){setState(() {
                        visiblepass? visiblepass=false: visiblepass=true;
                      });}, icon: Icon(Icons.visibility_off,color: Colors.black,)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 45,
                  width: scwidth-15,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: themeColorBlueh,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      onPressed: ()  {},
                      child:  Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dont,style: TextStyle(fontSize: 20),),
                    TextButton(onPressed: (){ Navigator.pushReplacementNamed(context, LoginPage.routeName);}, child: Text('Login',style: TextStyle(color: greentext,fontSize: 20),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
