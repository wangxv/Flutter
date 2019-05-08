import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import './topList_page.dart';

class HomeSimple extends StatefulWidget {
  @override
  _HomeSimpleState createState() => new _HomeSimpleState();
}

class _HomeSimpleState extends State<HomeSimple> {
  List imgList = [
    'http://img5.ph.126.net/YMvse8cBb7Iwx3tmp44Cig==/1569785945132344635.jpg',
    'http://i0.hdslb.com/bfs/article/202efff4f7e95e73eddf03bc1ac5432cf257c10e.jpg',
    'http://i0.hdslb.com/bfs/article/17cf2a476dd6a6c98e5ad749ca28f5d3365f3eb7.jpg',
    'http://i0.sinaimg.cn/gm/j/i/2009-02-26/U1850P115T41D161161F757DT20090226142309.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('首页'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: 4,
                viewportFraction: 0.8,
                scale: 0.9,
                control: new SwiperControl(),
                autoplay: true,
                duration: 1000,
                scrollDirection: Axis.horizontal,
                pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.white,
                  ),
                ),
                onTap: (index) => {
                      //详情
                    },
                itemWidth: 300.0,
                itemHeight: 400.0,
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10.0),
              height:500.0,
              child: new TopListSimple(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return new Image.network(
      imgList[index],
      fit: BoxFit.fill,
    );
  }
}
