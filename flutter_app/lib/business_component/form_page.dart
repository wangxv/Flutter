import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class FormSimple extends StatefulWidget {
  @override
  _FormSimpleState createState() => new _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> with TickerProviderStateMixin {
  String userName = '';
  String password = '';
  num _subject = 0;
  List<bool> _fruit = [false, false, false];
  bool _switch = false;

  double _percentage = 0.0;
  double _newPercentage = 0.0;

  AnimationController percentageAnimationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _percentage = 0.0;
    });
    percentageAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          _percentage = lerpDouble(
              _percentage, _newPercentage, percentageAnimationController.value);
        });
      });
  }

  _submitData() {
    print('userName:${userName}');
    print('password:${password}');
    print('_subject:${_subject}');
    print('_fruit:${_fruit.join('-')}');
    print('_switch:${_switch}');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(20),
      child: new Form(
        child: new Column(
          children: <Widget>[
            // new TextFormField(
            //   decoration: new InputDecoration(labelText: '姓名'),

            //   onSaved: (value) {
            //     setState(() {
            //       print(value);
            //       userName = value;
            //     });
            //   },
            // ),
            new TextField(
                decoration: new InputDecoration(labelText: '姓名'),
                // onSaved：当通过Form.save()保存表单时调用的方法
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                }),
            // new TextFormField(
            //   decoration: new InputDecoration(labelText: '密码'),
            //   obscureText: true,
            //   validator: (val) {
            //     return val.length < 4 ? '密码长度错误' : null;
            //   },
            //   onSaved: (val) {
            //     setState(() {
            //       password = val;
            //     });
            //   },
            // ),
            new TextField(
                obscureText: true,
                decoration: new InputDecoration(labelText: '密码'),
                // onSaved：当通过Form.save()保存表单时调用的方法
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                }),
            Container(
              child: Text('单选框  科目${_subject}'),
              padding: EdgeInsets.all(10),
            ),
            RadioListTile<num>(
              value: 1,
              title: Text('语文'),
              groupValue: _subject,
              onChanged: (value) {
                setState(() {
                  _subject = value;
                });
              },
            ),
            RadioListTile<num>(
              value: 2,
              title: Text('数学'),
              groupValue: _subject,
              onChanged: (value) {
                setState(() {
                  _subject = value;
                });
              },
            ),
            RadioListTile<num>(
              value: 3,
              title: Text('科学'),
              groupValue: _subject,
              onChanged: (value) {
                setState(() {
                  _subject = value;
                });
              },
            ),
            Container(
              // child: new Text('多选框'),
              child: new Text(
                  '多选框 水果 ${_fruit.length > 0 ? _fruit.join('-') : ''}'),
            ),
            CheckboxListTile(
              title: Text('苹果'),
              value: _fruit[0],
              onChanged: (bool value) {
                setState(() {
                  _fruit[0] = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('桃子'),
              value: _fruit[1],
              onChanged: (bool value) {
                setState(() {
                  _fruit[1] = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('葡萄'),
              value: _fruit[2],
              onChanged: (bool value) {
                setState(() {
                  _fruit[2] = value;
                });
              },
            ),
            Container(
              child: new Text('开关 switch ${_switch}'),
            ),
            Switch(
              value: _switch,
              onChanged: (bool value) {
                setState(() {
                  _switch = value;
                });
              },
            ),
            new RaisedButton(
              onPressed: _submitData,
              textColor: Colors.white,
              color: Colors.tealAccent[400],
              child: new Text('提交'),
            ),

            new Container(
              padding: EdgeInsets.all(20),
              child: new Text('canvas'),
            ),
            new Container(
              width: 200.0,
              height: 200.0,
              child: new CustomPaint(
                  foregroundPainter: new MyPainter(
                      lineColor: Colors.lightBlueAccent,
                      completeColor: Colors.blueAccent,
                      completePercent: _percentage,
                      width: 8.0),
                  child: new Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new RaisedButton(
                      color: Colors.pinkAccent[400],
                      splashColor: Colors.transparent,
                      shape: new CircleBorder(),
                      child: new Text('click'),
                      onPressed: () {
                        setState(() {
                          _percentage = _newPercentage;
                          _newPercentage += 10;
                          if (_newPercentage > 100.0) {
                            _percentage = 0.0;
                            _newPercentage = 0.0;
                          }
                          percentageAnimationController.forward(from: 0.0);
                        });
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2); //  坐标中心
    double radius = min(size.width / 2, size.height / 2); //  半径

    //  画圆方法
    canvas.drawCircle(center, radius, line);

    double arcAngle = 2 * pi * (completePercent / 100);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2, //  从正上方开始
        arcAngle,
        false,
        complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
