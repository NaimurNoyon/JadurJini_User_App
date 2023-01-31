import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadurjini_user/pages/home_page.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName='/profilepage';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text('Profile',style: (TextStyle(color: Colors.black)),),
          ],
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(100),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset('assets/images/profilepic.jpg',height: 200,width:200,fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Message',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Settings',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                Text('About Us',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                Text('Rating',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }
}
