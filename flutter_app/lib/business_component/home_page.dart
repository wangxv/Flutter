import  'package:flutter/material.dart';

class BCHomePageSimple extends StatefulWidget {
  @override
  _BCHomePageSimpleState createState() => new _BCHomePageSimpleState();
}
 
class _BCHomePageSimpleState extends State<BCHomePageSimple> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
       home: new Scaffold(
         appBar: new AppBar(
           title: const Text('店首页'),
         ),
         body:new ListView(
           children: <Widget>[
             // 轮播器

             //一行功能列表

             
           ],
         )
       ),
    );
  }
}