import 'package:flutter/material.dart';
import './chart_page.dart';

class LibrarySimple extends StatefulWidget {
  @override
  _LibrarySimpleState createState() => new _LibrarySimpleState();
}

class _LibrarySimpleState extends State<LibrarySimple> {
  List<Widget> _routeList = [new ChartSimple()];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('LibrarySimple'),
        ),
        body: new ListView(
          children: <Widget>[
            ListTile(
                title: Text('表格'),
                onTap: () {
                  _goDetail(0,'表格');
                })
          ],
        ),
      ),
    );
  }

  _goDetail(index,title) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('${title}')), body: _routeList[index]);
    }));
  }
}
