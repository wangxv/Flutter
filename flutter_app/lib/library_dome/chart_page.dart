import 'package:flutter/material.dart';
import './grouped_page.dart';
import './TimeSeriesSymbolAnnotationChart_page.dart';
import './line_charts_page.dart';
import './scatter_plot_page.dart';
import './pie_page.dart';

class ChartSimple extends StatefulWidget {
  @override
  _ChartSimpleState createState() => new _ChartSimpleState();
}

class _ChartSimpleState extends State<ChartSimple> {

  @override
  Widget build(BuildContext context) {


    return new Center(
      child: new ListView(
        children: <Widget>[
          new Text('柱状图'),
          new SizedBox(
            height: 300.0,
            child:  new GroupedStackedWeightPatternBarChart(),
          ),
          new Text('时间序列图'),
          new SizedBox(
            height: 300.0,
            child:  new TimeSeriesSymbolAnnotationChart(),
          ),
          new Text('折线图'),
          new SizedBox(
            height: 300.0,
            child:  new AreaAndLineChart(),
          ),
          new Text('点图'),
          new SizedBox(
            height: 300.0,
            child:  new BucketingAxisScatterPlotChart(),
          ),
          new Text('饼图'),
          new SizedBox(
            height: 300.0,
            child:  new PieOutsideLabelChart(),
          ),
         
        ],
      ),
    );
  }


  
}
