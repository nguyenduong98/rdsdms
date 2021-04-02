import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/home/bar-chart.widget.dart';
import 'package:rdsdms/views/home/order.widget.dart';
import 'package:rdsdms/constant/home.constant.dart';

class Statistics extends StatefulWidget {
  Statistics({Key key}) : super(key: key);

  @override
  createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  bool typeStatistic = HomeConstant.statisticByWeek;

  _updateTypeStatistic(bool value) {
    setState(() {
      typeStatistic = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
        child: Container(
      width: width,
      padding: EdgeInsets.only(top: height * 0.05),
      child: Column(
        children: [
          Order(
            updateTypeStatistic: _updateTypeStatistic,
          ),
          BarChartStatistic(typeStatistic: typeStatistic),
        ],
      ),
    ));
  }
}
