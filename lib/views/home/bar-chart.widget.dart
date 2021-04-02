import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:rdsdms/constant/home.constant.dart';
import 'package:rdsdms/mock/chart.mock.dart';

class BarChartStatistic extends StatefulWidget {
  final bool typeStatistic;

  BarChartStatistic({@required this.typeStatistic, Key key}) : super(key: key);

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
          padding: EdgeInsets.only(
              top: height * 0.05, bottom: height * 0.02, left: 5),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    maxY: 9,
                    minY: 0,
                    groupsSpace:
                        widget.typeStatistic == HomeConstant.statisticByWeek
                            ? width * 0.06
                            : width * 0.014,
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => TextStyle(
                            color: Colors.grey[600],
                            fontSize: widget.typeStatistic ==
                                    HomeConstant.statisticByWeek
                                ? 15
                                : 11),
                        getTitles: (double value) {
                          if (widget.typeStatistic ==
                              HomeConstant.statisticByWeek) {
                            switch (value.toInt()) {
                              case 0:
                                return 'MON';
                              case 1:
                                return 'TUE';
                              case 2:
                                return 'WED';
                              case 3:
                                return 'THU';
                              case 4:
                                return 'FRI';
                              case 5:
                                return 'SAT';
                              case 6:
                                return 'SUN';
                              default:
                                return '';
                            }
                          } else {
                            switch (value.toInt()) {
                              case 0:
                                return 'M';
                              case 1:
                                return 'T';
                              case 2:
                                return 'W';
                              case 3:
                                return 'T';
                              case 4:
                                return 'F';
                              case 5:
                                return 'S';
                              case 6:
                                return 'S';
                              default:
                                return '';
                            }
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) =>
                            TextStyle(color: Colors.grey[600], fontSize: 15),
                        getTitles: (double value) {
                          if (value == 0) {
                            return '0';
                          }
                          return '${value.toInt()} km';
                        },
                        reservedSize: 35,
                      ),
                    ),
                    gridData: FlGridData(
                      getDrawingHorizontalLine: (value) {
                        if (value == 0) {
                          return FlLine(color: Colors.white);
                        }
                        return FlLine(
                          color: Colors.white,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups:
                        widget.typeStatistic == HomeConstant.statisticByWeek
                            ? ChartMock.dataByWeek
                                .asMap()
                                .entries
                                .map((item) => BarChartGroupData(
                                      x: item.key,
                                      barRods: [
                                        BarChartRodData(
                                          y: item.value.toDouble(),
                                          width: barWidth,
                                          colors: [
                                            Colors.red,
                                            Colors.purple[900],
                                          ],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6)),
                                        ),
                                      ],
                                    ))
                                .toList()
                            : ChartMock.dataByMonth
                                .asMap()
                                .entries
                                .map((item) => BarChartGroupData(
                                      x: item.key % 7,
                                      barRods: [
                                        BarChartRodData(
                                            y: item.value.toDouble(),
                                            width: 5,
                                            colors: [
                                              Colors.red,
                                              Colors.purple[900],
                                            ],
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                topRight: Radius.circular(6)))
                                      ],
                                    ))
                                .toList(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                alignment: Alignment.topLeft,
                child: Text('Chỉ tiêu bán hàng',
                    style: TextStyle(color: Colors.blue, fontSize: 16)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: LinearPercentIndicator(
                  width: width * 0.94,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 40.0,
                  percent: 0.2,
                  center: Text("20.0%"),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.grey[300],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
