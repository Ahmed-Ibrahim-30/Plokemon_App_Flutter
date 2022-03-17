import 'package:flutter/material.dart';
import 'package:task4/View/appbar.dart';
import 'package:task4/View/homepage.dart';
import 'package:task4/View/appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyApp_State();
}
class MyApp_State extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(),
        appBar:App_Bar(),
        body: HomePage(),
      ),
    );
  }
}
