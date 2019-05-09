import 'package:flutter/material.dart';
// import '../dome/dome_page.dart';
// import '../layout/layout_page.dart';
// import '../animated_list/animated_list_page.dart';
// import '../appbar_buttom/appbar_buttom_page.dart';
// import '../basic_appbar/basic_appbar_page.dart';
// import '../expansion_tile/expansion_tile_page.dart';
// import '../exercise/exercise_page.dart';
import '../home/home_page.dart';
import '../mine/mine_page.dart';
import '../library_dome/library_page.dart';
import '../business_component/home_page.dart';
import 'navigation_icon.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;
  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      // new NavigationIconView(
      //   icon: new Icon(Icons.edit),
      //   title: new Text("ExerciseSimple"),
      //   vsync: this,
      // ),
      // new NavigationIconView(
      //   icon: new Icon(Icons.assignment),
      //   title: new Text("dome"),
      //   vsync: this,
      // ),
      // new NavigationIconView(
      //   icon: new Icon(Icons.email),
      //   title: new Text("animated"),
      //   vsync: this,
      // ),
      // new NavigationIconView(
      //   icon: new Icon(Icons.airplanemode_active),
      //   title: new Text("appbar_buttom"),
      //   vsync: this,
      // ),
      // new NavigationIconView(
      //   icon: new Icon(Icons.brightness_4),
      //   title: new Text("basic_appbar"),
      //   vsync: this,
      // ),
      // new NavigationIconView(
      //   icon: new Icon(Icons.aspect_ratio),
      //   title: new Text("expansion_tile"),
      //   vsync: this,
      // ),
      // new NavigationIconView(
      //   icon: new Icon(Icons.add_shopping_cart),
      //   title: new Text("layout"),
      //   vsync: this,
      // )
      new NavigationIconView(
        icon: new Icon(Icons.home),
        title: new Text("首页"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.account_balance),
        title: new Text("我的练习"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.local_library),
        title: new Text("常用库"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.person),
        title: new Text("我的"),
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      // new ExerciseSimple(),
      // new RandomWords(),
      // new AnimatedListSample(),
      // new AppBarBottomSample(),
      // new BasicAppBarSample(),
      // new ExpansionTileSample(),  
      // new LayoutSimple()
      new HomeSimple(),
      new BCHomePageSimple(),
      new LibrarySimple(),
      new MineSimple()
      ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext content) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) =>
                navigationIconView.item)
            .toList(),
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
        });
    return new MaterialApp(
        home: new Scaffold(
      body: new Center(
        child: _currentPage,
      ),
      bottomNavigationBar: bottomNavigationBar,
    ));
  }
}
