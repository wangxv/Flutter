import 'package:flutter/material.dart';
import 'package:flutter_app/tool/index.dart';
import 'dart:async';

class DatePickerSimple extends StatefulWidget {
  @override
  _DatePickerSimpleState createState() => new _DatePickerSimpleState();
}

class _DatePickerSimpleState extends State<DatePickerSimple> {
  Timer _countdownTimer;
  int _countdownNum = 59;
  String _countdownStr = '';
  String _timeformat = '';
  bool _countdown = true;

  var _date;
  var _time;

  _showDataPicker() async {
    Locale myLocale = Localizations.localeOf(context);

    var picker = await showDatePicker(
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1995),
        lastDate: DateTime(2222),
        locale: myLocale);
    setState(() {
      // _date = picker.toString();
      _date = formatDate(picker, [yyyy, '-', mm, '-', dd]);
    });
  }

  _showTimePicker() async {
    var picker =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _time = picker.toString();
    });
  }

  _startCountDown() {
    // var time = new CountdownTimer(60000,1000)
    _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownNum > 0) {
          _countdown = false;
          _countdownStr = '倒计时(${_countdownNum--})';
        } else {
          _countdownStr = '倒计时开始';
          _countdown = true;
          _countdownNum = 59;
          _countdownTimer.cancel();
          _countdownTimer = null;
        }
      });
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            color: Colors.lightBlue,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            onPressed: () => _showDataPicker(),
            child: new Text(
              _date == null ? '选择日期' : _date,
              style: new TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          RaisedButton(
            textColor: Colors.white,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            color: Colors.tealAccent[400],
            onPressed: () => _showTimePicker(),
            child: Text(
              _time == null ? '选择时间' : _time,
              style: new TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          RaisedButton(
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              color: Colors.purple,
              onPressed: () => _startCountDown(),
              child: Text(
                _countdown ? '计时开始' : _countdownStr,
                style: new TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
          Container(
            padding: EdgeInsets.all(20),
            height: 200,
            child: ListView(
              children: <Widget>[
                Text(_timeformat),
                FlatButton(
                  child: new Text('yyyy-mm-dd'),
                  onPressed: () {
                    setState(() {
                      _timeformat =
                          formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
                    });
                  },
                ),
                FlatButton(
                  child: new Text('HH:nn:SS'),
                  onPressed: () {
                    setState(() {
                      _timeformat =
                          formatDate(DateTime.now(), [HH, ':', nn, ':', ss]);
                    });
                  },
                ),
                FlatButton(
                  child: new Text('yyyy-mm-dd HH:nn:SS'),
                  onPressed: () {
                    setState(() {
                      _timeformat =
                          formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd,' ', HH, ':', nn, ':', ss]);
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
      height: 400,
    );
  }
}
