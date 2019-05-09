import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class NoteSimple extends StatefulWidget {
  @override
  _NoteSimpleState createState() => new _NoteSimpleState();
}

class _NoteSimpleState extends State<NoteSimple> {
  List note = [];
  String title = '';
  String content = '';

  // Future _saveData(id, title, content) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(title, content);

  //   setState(() {
  //     note.insert(0, {id: id, title: title, content: content});
  //   });
  //   print('存储$title 为:$content');
  // }

  // Future _readData(title) async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String content = preferences.get(title);
  //   print(content);
  // }

  // Future _removeData(title) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove(title);

  //   print('删除$title');
  // }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new ListView(
        children: <Widget>[
          new TextField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.text_fields),
                labelText: '请输入标题',
                helperText: '请输入一个有效的标题'),
            keyboardType: TextInputType.text,
            maxLength: 50,
            maxLines: 1,
            onSubmitted: (str) {
              setState(() {
                title = str;
              });
            },
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: new TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.text_fields),
                  labelText: '请输入内容',
                  helperText: '请输入一个有意思'),
              keyboardType: TextInputType.text,
              maxLength: 500,
              maxLines: 5,
              onSubmitted: (str) {
                setState(() {
                  content = str;
                });
              },
            ),
            height: 200.0,
          ),
          new RaisedButton(
            child: new Text('添加'),
            onPressed: () {
              // _saveData(note.length, title, content);
            },
          ),
          new Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: new Container(
              child: new ExpansionPanelList(
                children: note.map(
                  (item) {
                    return new ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return new Text(item.title);
                      },
                      body: new Padding(
                        padding: EdgeInsets.all(5.0),
                        child: new Text(item.content),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
