import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/home/bar-chart.widget.dart';
import 'package:rdsdms/views/home/order.widget.dart';
import 'package:rdsdms/views/home/pie-chart.widget.dart';

class Statistics extends StatefulWidget {
  Statistics({Key key}) : super(key: key);

  @override
  createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
        child: Container(
      width: width,
      padding: EdgeInsets.only(top: height * 0.13),
      child: Column(
        children: [
          Order(),
          BarChartStatistic(),
          // PieChartStatistic(),
        ],
      ),
    ));
  }
}
