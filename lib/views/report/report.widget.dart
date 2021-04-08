import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:rdsdms/views/report/children-screen/order-list/order-list.widget.dart';
import 'package:rdsdms/views/report/children-screen/order-report/order-report.widget.dart';
import 'package:rdsdms/views/report/children-screen/route-report/route-report.widget.dart';
import 'package:rdsdms/views/report/children-screen/sales-report/sales-report.widget.dart';
import 'package:rdsdms/views/report/children-screen/sales-targets/sales-targets.widget.dart';
import 'package:rdsdms/views/report/children-screen/cancel-order-list/cancel-order-list.widget.dart';
import 'package:rdsdms/views/report/children-screen/contruction-report/contruction-report.widget.dart';

class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  @override
  createState() => ReportState();
}

class ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Báo Cáo'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 2),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(OrderList());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/order-n-list.png',
                                    scale: 0.7,
                                  ),
                                )),
                            Expanded(
                                flex: 8,
                                child: Text(
                                  'Danh sách đơn hàng trong ngày',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 2),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(CancelOrderList());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/order-c-list.png',
                                    scale: 0.7,
                                  ),
                                )),
                            Expanded(
                                flex: 8,
                                child: Text(
                                  'Danh sách đơn hàng hủy',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 2),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(SalesTargets());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/target-icon.png',
                                    scale: 0.7,
                                  ),
                                )),
                            Expanded(
                                flex: 8,
                                child: Text(
                                  'Chỉ tiêu và doanh số bán hàng',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 2),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(SalesReport());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/report-icon.png',
                                    scale: 0.7,
                                  ),
                                )),
                            Expanded(
                                flex: 8,
                                child: Text(
                                  'Báo cáo doanh số',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 2),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(OrderReport());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/order-list.png',
                                    scale: 0.7,
                                  ),
                                )),
                            Expanded(
                                flex: 8,
                                child: Text(
                                  'Báo cáo đơn hàng',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 2),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(RouteReport());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/rptroute-icon.png',
                                    scale: 0.7,
                                  ),
                                )),
                            Expanded(
                                flex: 8,
                                child: Text(
                                  'Lộ trình nhân viên',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      width: width,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(ContructionReport());
                        },
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/tpc-icon.png',
                                    scale: 0.7,
                                  ),
                                )),
                            Expanded(
                                flex: 8,
                                child: Text(
                                  'Thăm công trình',
                                  style: TextStyle(fontSize: 18),
                                ))
                          ],
                        ),
                      ))
                ],
              ),
            )));
  }
}
