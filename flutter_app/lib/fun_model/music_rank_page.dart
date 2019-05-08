import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../news_bean.dart';

class MusicRankSimple extends StatefulWidget {
  @override
  _MusicRankSimpleState createState() => new _MusicRankSimpleState();
}

class _MusicRankSimpleState extends State<MusicRankSimple> {
  List<Result> dataList = [];
  var currentPanelIndex = 1;
  var currentName = '';

  @override
  
  Widget build(BuildContext context) {
    void _getData() async {
      Dio dio = new Dio();
      // Response response = await dio.get("https://api.apiopen.top/musicRankings",data:{},options: new Options(responseType: ResponseType.PLAIN));
      Response response = await dio.get("https://api.apiopen.top/musicRankings");
      Autogenerated autogenerated = Autogenerated.fromJson(response.data);

      setState(() {
        dataList = autogenerated.result;
      });
    }

    _getData();
    return new Container(
        child: new ListView(
          children: <Widget>[
            dataList.length <= 0
                ? new Text('暂无数据')
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                    child: new ExpansionPanelList(
                      expansionCallback: (panlIndex, isExpanded) {
                        setState(() {
                          currentName = (currentPanelIndex != panlIndex ? dataList[panlIndex].name : '');
                          currentPanelIndex = (currentPanelIndex != panlIndex ? panlIndex : -1);
                        });
                      },
                      children: dataList.map((music) {
                        return new ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return new Container(
                              child: new ListTile(
                                leading: new CircleAvatar(
                                  backgroundImage: new NetworkImage(music.picS210),
                                ),
                                title: new Text(music.name),
                                subtitle: Text(music.comment),
                                onTap: () => {},
                              ),
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              // height: 120.0,
                            );
                          },
                          body: new Padding(
                            padding: EdgeInsets.all(5.0),
                            child: new ListBody(
                              children: music.content.map((item) {
                                return Container(
                                  child: new ListTile(
                                    contentPadding: EdgeInsets.all(5.0),
                                    leading: Image.network(item.picSmall),
                                    title: new Text(item.albumTitle),
                                    subtitle: Text(item.title),
                                  ),
                                  padding: EdgeInsets.only(bottom: 10.0),
                                );
                              }).toList(),
                            ),
                          ),
                          isExpanded: music.name == currentName,
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
    );
  }
}