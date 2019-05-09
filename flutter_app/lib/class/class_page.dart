import 'package:flutter/material.dart';

class ClassSimple extends StatefulWidget {
  @override
  _ClassSimpleState createState() => new _ClassSimpleState();
}

class _ClassSimpleState extends State<ClassSimple> {
  bool _radiovalue1 = true;
  bool _radiovalue = true;
  bool _checkboxvalue = true;
  bool _checkboxvalue1 = false;
  bool _switchvalue = true;
  bool _switchvalue1 = false;
  double _slidervalue1 = 10;

  int currentStep = 0;
  List<Step> mySteps = [
    new Step(
      title: new Text('Step 1'),
      content: new Text('Step1 Hello'),
      isActive: true,
    ),
    new Step(
      title: new Text('Step 2'),
      content: new Text('Step2 World'),
      isActive: true,
    ),
    new Step(
      title: new Text('Step 3'),
      content: new Text('Step3 !'),
      isActive: true,
    ),
  ];

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> pageLists = [
      _wAlertDialogs(),
      _wRichText(),
      _wCard(),
      _wForm(),
      _wStepper()
    ];
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(
            title: const Text('ClassSimple'),
          ),
          body: new ListView(
            children: <Widget>[
              new ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  // new FlatButton(
                  //   child: new Text('弹出框'),
                  //   onPressed: () {
                  //     setState(() {
                  //       currentPage = 0;
                  //     });
                  //   },
                  // ),
                  new FlatButton(
                    child: new Text('富文本框'),
                    onPressed: () {
                      setState(() {
                        currentPage = 1;
                      });
                    },
                  ),
                  new FlatButton(
                    child: new Text('卡片'),
                    onPressed: () {
                      setState(() {
                        currentPage = 2;
                      });
                    },
                  ),
                  // new FlatButton(
                  //   child: new Text('表单'),
                  //   onPressed: () {
                  //     setState(() {
                  //       currentPage = 3;
                  //     });
                  //   },
                  // ),
                  new FlatButton(
                    child: new Text('步骤指示器'),
                    onPressed: () {
                      setState(() {
                        currentPage = 4;
                      });
                    },
                  ),
                ],
              ),
              new Container(child: pageLists[currentPage])
            ],
          ),
          drawer: _wDrawer()),
    );
  }

  Widget _wAlertDialogs() {
    return new Container(
      child: new AlertDialog(
        title: Text('弹窗'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('这是一个弹窗'), Text('写一个弹窗dome')],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('确定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.green,
            textColor: new Color(0xFFFFFFFF),
          )
        ],
      ),
    );
  }

  Widget _wRichText() {
    return new Container(
      padding: EdgeInsets.all(20.0),
      child: new RichText(
        text: TextSpan(
          text: 'Hello',
          style: TextStyle(color: Colors.black, fontSize: 18.0),
          children: <TextSpan>[
            TextSpan(
                text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'Word!'),
            TextSpan(text: 'text. '),
            TextSpan(text: 'This is '),
            TextSpan(text: 'larger ', style: TextStyle(fontSize: 22.0)),
            TextSpan(
              text: 'font size.',
            ),
            TextSpan(
              text: 'This is ',
            ),
            TextSpan(text: 'red ', style: TextStyle(color: Colors.red)),
            TextSpan(
              text: 'color.',
            ),
          ],
        ),
      ),
      width: 300.0,
      height: 200.0,
    );
  }

  Widget _wCard() {
    return new Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('card 标题'),
              subtitle:
                  Text('描述 Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _wDrawer() {
    return new Drawer(
      child: new ListView(
        padding: const EdgeInsets.only(),
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('张三'),
            accountEmail: new Text('zhangsan@qq.cn'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage('images/img1.jpg'),
            ),
            onDetailsPressed: () {},
            otherAccountsPictures: <Widget>[
              new CircleAvatar(
                backgroundImage: new AssetImage('images/img1.jpg'),
              )
            ],
          ),
          new ClipRect(
            child: new ListTile(
              leading: new CircleAvatar(child: new Text("A")),
              title: new Text('Drawer item A'),
              onTap: () => {},
            ),
          ),
          new ListTile(
            leading: new CircleAvatar(child: new Text("B")),
            title: new Text('Drawer item B'),
            subtitle: new Text("Drawer item B subtitle"),
            onTap: () => {},
          ),
          new AboutListTile(
            icon: new CircleAvatar(child: new Text("Ab")),
            child: new Text("About"),
            applicationName: "Test",
            applicationVersion: "1.0",
            applicationIcon: new Image.asset(
              "images/img1.jpg",
              width: 64.0,
              height: 64.0,
            ),
            applicationLegalese: "applicationLegalese",
            aboutBoxChildren: <Widget>[
              new Text("BoxChildren"),
              new Text("box child 2")
            ],
          ),
        ],
      ),
    );
  }

  Widget _wForm() {
    return new Column(
      children: <Widget>[
        new TextField(
          autofocus: false,
          maxLength: 100,
          decoration: InputDecoration(
            // 输入框文本周边的距离
            contentPadding: EdgeInsets.all(10.0),
            // 提示文字
            hintText: '请输入账户名',
            // 提示文本颜色
            hintStyle: new TextStyle(color: Colors.white54),
          ),
        ),
        new Checkbox(
          value: _checkboxvalue,
          onChanged: (val) {
            print('$val');
            setState(() {
              _checkboxvalue = val;
            });
          },
          tristate: false,
        ),
        new CheckboxListTile(
          title: Text('checkboxListTile'),
          value: _checkboxvalue1,
          onChanged: (val) {
            setState(() {
              _checkboxvalue1 = val;
            });
          },
        ),
        new Radio(
          groupValue: _radiovalue,
          value: true,
          onChanged: (val) => {
                setState(() {
                  _radiovalue = val;
                })
              },
        ),
        new Radio(
          groupValue: _radiovalue1,
          value: false,
          onChanged: (val) {
            setState(() {
              _radiovalue1 = val;
            });
          },
        ),
        new Switch(
          value: _switchvalue,
          onChanged: (val) {
            setState(() {
              _switchvalue = val;
            });
          },
        ),
        new Switch(
          value: _switchvalue1,
          onChanged: (val) {
            setState(() {
              _switchvalue1 = val;
            });
          },
        ),
        new Slider(
          value: _slidervalue1,
          max: 100,
          min: 0,
          onChanged: (val) {
            setState(() {
              _slidervalue1 = val;
            });
          },
        ),
      ],
    );
  }

  Widget _wStepper() {
    return new Container(
      child: new Stepper(
        currentStep: this.currentStep,
        steps: mySteps,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepCancel: () {
          setState(() {
            if (currentStep > 0) {
              currentStep = currentStep - 1;
            } else {
              currentStep = 0;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (currentStep < mySteps.length - 1) {
              currentStep = currentStep + 1;
            } else {
              currentStep = 0;
            }
          });
        },
      ),
    );
  }
}
