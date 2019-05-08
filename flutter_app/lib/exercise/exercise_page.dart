import 'package:flutter/material.dart';
import 'dart:async';
import '../class/class_page.dart';
import '../fun_model/fun_model_page.dart';

class ExerciseSimple extends StatefulWidget {
  @override
  _ExerciseSimpleState createState() => new _ExerciseSimpleState();
}

class _ExerciseSimpleState extends State<ExerciseSimple> {
  int time = 0;
  Timer _timer;

  void _add() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        return new Container(
          child: new SimpleDialog(
            title: const Text('click add'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('确定'),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('取消'),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _startTime() {
    if (_timer != null) {
      // showDialog<Null>(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (build) {
      //       return AlertDialog(
      //         title: Text('注意'),
      //         titlePadding: EdgeInsets.only(left: 24, top: 20),
      //         content: Text('已经开始在计时了！'),
      //         actions: <Widget>[
      //           FlatButton(
      //             child: Text('知道了'),
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //           )
      //         ],
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(5)),
      //       );
      //     });

      return;
    }
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time++;
      });
    });
  }

  void _stopTime() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      time = 0;
    });

    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ExerciseSimple'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.add_box),
              tooltip: 'add box',
              onPressed: _add,
            ),
            new IconButton(
              icon: const Icon(Icons.access_alarm),
              tooltip: 'add box',
              onPressed: _startTime,
            ),
            new IconButton(
              icon: const Icon(Icons.access_time),
              tooltip: 'add box',
              onPressed: _stopTime,
            ),
          ],
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              child: new Text(
                "摘录显示段落中文本的最初行，并且通常使用省略号处理溢出文本。在HTML / CSS中，摘要不能超过一行。截断多行需要一些JavaScript代码。",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      begin: const Alignment(0.0, -1.0),
                      end: const Alignment(0.0, 0.6),
                      colors: <Color>[
                    const Color(0xffef5350),
                    const Color(0x00ef5350)
                  ])),
            ),
            new Container(
                child: new Stack(
                  children: <Widget>[
                    new Positioned(
                        child: new Container(
                            child: new Transform(
                              child: new Container(
                                child: new Text(
                                  '$time transform dome  "摘录显示段落中文本的最初行，并且通常使用省略号处理溢出文本。在HTML / CSS中，摘要不能超过一行。截断多行需要一些JavaScript代码。"',
                                  textAlign: TextAlign.center,
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.red[400],
                                ),
                                padding: new EdgeInsets.all(16.0),
                              ),
                              alignment: Alignment.center,
                              transform: new Matrix4.identity()
                                ..rotateZ(15 * 3.1415827 / 180),
                            ),
                            width: 320.0,
                            height: 140.0),
                        left: 50.0,
                        top: 120.0),
                  ],
                ),
                width: 520.0,
                height: 290.0),
            new Container(
              child: new FlatButton(
                child: new Text('跳转到别的页面'),
                color: Colors.blue,
                textColor: new Color(0xffffffff),
                onPressed: _goPage,
              ),
              width: 200.0,
              height: 100.0,
              alignment: Alignment(-0.5, -1.1),
            ),
            new Container(
              child: new FlatButton(
                child: new Text('功能页面'),
                onPressed: _goFunPage,
                color: Colors.green,
                textColor: new Color(0xffffffff),
              ),
              alignment: Alignment(-0.0, -1.0),
            )
          ],
        ),
      ),
    );
  }

  void _goPage() {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        return new Scaffold(body: new ClassSimple());
      },
    ));
  }

  void _goFunPage() {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        return new Scaffold(body: new FunModelSimple());
      },
    ));
  }
}
