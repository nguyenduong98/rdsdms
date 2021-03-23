import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/shares/tabs.widget.dart';

class BarChartStatistic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartStatisticState();
}

class BarChartStatisticState extends State<BarChartStatistic> {
  static double barWidth = 22;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          top: 10,
          left: width * 0.01,
          right: width * 0.01,
          bottom: height * 0.05),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: height * 0.05),
          child: Column(
            children: [
              TabsWidget(),
              Container(
                padding: EdgeInsets.only(right: 25),
                width: double.infinity,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    maxY: 20,
                    minY: 0,
                    groupsSpace: width * 0.15,
                    barTouchData: BarTouchData(
                      enabled: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) =>
                            TextStyle(color: Colors.blue[900], fontSize: 10),
                        margin: 10,
                        rotateAngle: 0,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Mon';
                            case 1:
                              return 'Tue';
                            case 2:
                              return 'Wed';
                            case 3:
                              return 'Thu';
                            case 4:
                              return 'Fri';
                            case 5:
                              return 'Sat';
                            case 6:
                              return 'Sun';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) =>
                            TextStyle(color: Colors.blue[900], fontSize: 10),
                        rotateAngle: 45,
                        getTitles: (double value) {
                          if (value == 0) {
                            return '0';
                          }
                          return '${value.toInt()}';
                        },
                        interval: 5,
                        margin: 8,
                        reservedSize: 30,
                      ),
                    ),
                    gridData: FlGridData(
                      checkToShowHorizontalLine: (value) => value % 5 == 0,
                      getDrawingHorizontalLine: (value) {
                        if (value == 0) {
                          return FlLine(
                              color: Color(0xff363753), strokeWidth: 3);
                        }
                        return FlLine(
                          color: Color(0xff2a2747),
                          strokeWidth: 0.8,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[400]),
                            top: BorderSide(color: Colors.grey[400]))),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            y: 7.5,
                            width: barWidth,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            rodStackItems: [
                              BarChartRodStackItem(0, 2, Colors.blue[600]),
                              BarChartRodStackItem(2, 5, Colors.orange),
                              BarChartRodStackItem(5, 7.5, Colors.green),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            y: 7,
                            width: barWidth,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            rodStackItems: [
                              BarChartRodStackItem(0, 1.5, Colors.blue[600]),
                              BarChartRodStackItem(1.5, 3.5, Colors.orange),
                              BarChartRodStackItem(3.5, 7, Colors.green),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(
                            y: 7,
                            width: barWidth,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            rodStackItems: [
                              BarChartRodStackItem(0, 1.5, Colors.blue[600]),
                              BarChartRodStackItem(1.5, 3, Colors.orange),
                              BarChartRodStackItem(3, 7, Colors.green),
                            ],
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 6,
                        barRods: [
                          BarChartRodData(
                            y: 11,
                            width: barWidth,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            rodStackItems: [
                              BarChartRodStackItem(0, 1.2, Colors.blue[600]),
                              BarChartRodStackItem(1.2, 6, Colors.orange),
                              BarChartRodStackItem(6, 11, Colors.green),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 10, height: 10, color: Colors.blue[600]),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
                      child: Text('Chưa xử lý'),
                    ),
                    Container(width: 10, height: 10, color: Colors.orange),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
                      child: Text('Đang xử lý'),
                    ),
                    Container(width: 10, height: 10, color: Colors.green),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
                      child: Text('Đã giao'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
