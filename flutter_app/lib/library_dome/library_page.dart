import 'package:flutter/material.dart';
import './chart_page.dart';
import './video_page.dart';
import './video_dome.dart';

class LibrarySimple extends StatefulWidget {
  @override
  _LibrarySimpleState createState() => new _LibrarySimpleState();
}

class _LibrarySimpleState extends State<LibrarySimple> {
  List<Widget> _routeList = [
    new ChartSimple(),
    new VideoSimple()
    // new VideoApp()
    ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('LibrarySimple'),
        ),
        body: new ListView(
          children: <Widget>[
            Card(
              color: Colors.purple[700],
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Icon(Icons.show_chart,color: Colors.greenAccent[400],),
                  ),
                  title: Text('表格',style:new TextStyle(color: Colors.white)),
                  onTap: () {
                    _goDetail(0, '表格');
                  }),
            ),
            Card(
              color: Colors.purple[600],
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Icon(Icons.slideshow ,color: Colors.greenAccent[400],),
                  ),
                  title: Text('音频',style:new TextStyle(color: Colors.white)),
                  onTap: () {
                    _goDetail(1, '音频');
                  }),
            ),
          ],
        ),
      ),
    );
  }

  _goDetail(index, title) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('${title}')),
          body: _routeList[index]);
    }));
  }
}
