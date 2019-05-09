import 'package:flutter/material.dart';
import './music_rank_page.dart';
import './poetry_page.dart';
import './img_page.dart';

class FunModelSimple extends StatefulWidget {
  @override
  _FunModelSimpleState createState() => new _FunModelSimpleState();
}

class _FunModelSimpleState extends State<FunModelSimple> {
  final String userName = '李四';
  final String userEmail = 'lisi@qq.cn';
  final String avatar = 'images/img1.jpg';
  var currentPage = 1;

  List<Widget> pageList = [
     new PoetrySimple(),
     new MusicRankSimple(),
     new ImgSimple()
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('funModel'),
        ),
        body: pageList[currentPage],
        drawer: _mDrawer(),
      ),
    );
  }

  Widget _mDrawer() {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('$userName'),
            accountEmail: new Text('$userEmail'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage('$avatar'),
            ),
            onDetailsPressed: () {},
            otherAccountsPictures: <Widget>[
              new CircleAvatar(
                backgroundImage: new AssetImage('$avatar'),
              )
            ],
          ),
          new ClipRect(
            child: new ListTile(
                leading: new CircleAvatar(
                  child: new Text("诗词"),
                ),
                title: new Text("唐诗宋词"),
                onTap: () {
                  setState(() {
                    currentPage = 0;
                  });
                }),
          ),
          new ListTile(
              leading: new CircleAvatar(child: new Text("排行")),
              title: new Text("音乐排行榜"),
              onTap: () {
                setState(() {
                  currentPage = 1;
                });
              }),
          new ListTile(
              leading: new CircleAvatar(child: new Text("图片")),
              title: new Text("图片推荐"),
              onTap: () {
                setState(() {
                  currentPage = 2;
                });
              }),
          new AboutListTile(
            icon: new CircleAvatar(
              child: new Text("乐库"),
            ),
            child: new Text("各种音乐"),
            applicationName: "乐动",
            applicationVersion: "v1.0.0",
            applicationIcon:
                new Image.asset('$avatar', width: 64.0, height: 64.0),
            applicationLegalese: "applicationLegalese",
            aboutBoxChildren: <Widget>[new Text("听音乐，在这里"), new Text("乐动我心")],
          )
        ],
      ),
    );
  }
}
