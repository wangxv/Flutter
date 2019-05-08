import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}
 
class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return new Center(
       child: new Container(
         width:double.infinity,
         height: double.infinity,
         child:new CupertinoActivityIndicator(radius: 20.0),
         color: Colors.grey[800],
       )
      
    );
  }
}