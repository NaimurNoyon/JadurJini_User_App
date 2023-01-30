import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  static const String routeName='/activitypage';
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag,color: Colors.black,size: 30,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Recent',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
