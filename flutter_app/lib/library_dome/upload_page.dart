import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class UploadSImple extends StatefulWidget {
  @override
  _UploadSImpleState createState() => new _UploadSImpleState();
}

class _UploadSImpleState extends State<UploadSImple> {
  String _value;
  String _allText = '';
  Future<File> _getLocalFile() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String dir = docDir.path;
    final file = new File('$dir/dome.txt');
    return file;
  }

  void _readContent() async {
    File file = await _getLocalFile();
    String contents = await file.readAsString();
    setState(() {
      _allText = contents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
      children: <Widget>[
        RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: _readContent,
          child: Text('获取本地数据'),
        ),
        TextField(
          controller: TextEditingController(text: _value),
          onChanged: (String val) {
            _value = val;
          },
          onSubmitted: (String val) {
            _value = val;
          },
        ),
      ],
    ));
  }
}
