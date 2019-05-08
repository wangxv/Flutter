import  'package:flutter/material.dart';
import './DatePicker.dart';

class BCHomePageSimple extends StatefulWidget {
  @override
  _BCHomePageSimpleState createState() => new _BCHomePageSimpleState();
}
 
class _BCHomePageSimpleState extends State<BCHomePageSimple> {

  // List<Widget> componentLists = [];
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
       home: new Scaffold(
         appBar: new AppBar(
           title: const Text('常用工具'),
         ),
         body:new ListView(
           children: <Widget>[
             new Text('时间操作'),
             new DatePickerSimple()
           ],
         )
       ),
    );
  }
}