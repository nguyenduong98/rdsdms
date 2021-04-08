import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:rdsdms/views/report/children-screen/route-report/dialog.widget.dart';

class RouteReport extends StatefulWidget {
  RouteReport({Key key}) : super(key: key);

  @override
  createState() => RouteReportState();
}

class RouteReportState extends State<RouteReport> {
  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text('Báo cáo lộ trình'),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      AntDesign.filter,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                insetPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                content: Builder(
                                  builder: (context) {
                                    return DialogWidget();
                                  },
                                ),
                              ));
                    },
                  )
                ]),
            body: GestureDetector(
              onHorizontalDragStart: (value) {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          insetPadding: EdgeInsets.only(left: 10, right: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          content: Builder(
                            builder: (context) {
                              return DialogWidget();
                            },
                          ),
                        ));
              },
              child: Container(
                color: Colors.grey[200],
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Container(
                    width: width,
                    margin: EdgeInsets.only(top: 10, right: 5, left: 5),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        buildHeaderTable(),
                        ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            children: buildListRouteReport(data)),
                        InkWell(
                          onTap: () {
                            getCsv();
                          },
                          child: Container(
                            child: Text('Export'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  Widget buildHeaderTable() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 80,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            alignment: Alignment.center,
            child: Text('Ngày', style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey),
                              right: BorderSide(color: Colors.grey),
                              bottom: BorderSide(color: Colors.grey))),
                      child: Text('Tuyến trong ngày (bao gồm ngoại tuyến)',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey))),
                        child: Text('Tổng',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w800)),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey))),
                        alignment: Alignment.center,
                        child: Text('Đã đến',
                            style: TextStyle(fontWeight: FontWeight.w800)),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey))),
                        alignment: Alignment.center,
                        child: Text('Chưa đến',
                            style: TextStyle(fontWeight: FontWeight.w800)),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey))),
                        alignment: Alignment.center,
                        child: Text(
                          'Chi tiết đã đến',
                          style: TextStyle(fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey))),
                        alignment: Alignment.center,
                        child: Text(
                          'Chi tiết chưa đến',
                          style: TextStyle(fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> buildListRouteReport(List<int> data) {
    return data.map((item) => buildRouteReport(item)).toList();
  }

  Widget buildRouteReport(int item) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Text('12/12/2021'),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                  right: BorderSide(color: Colors.grey))),
                          child: Text('Tổng',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w800)),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                  right: BorderSide(color: Colors.grey))),
                          alignment: Alignment.center,
                          child: Text('Đã đến',
                              style: TextStyle(fontWeight: FontWeight.w800)),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                  right: BorderSide(color: Colors.grey))),
                          alignment: Alignment.center,
                          child: Text('Chưa đến',
                              style: TextStyle(fontWeight: FontWeight.w800)),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                  right: BorderSide(color: Colors.grey))),
                          alignment: Alignment.center,
                          child: Text(
                            'Chi tiết đã đến',
                            style: TextStyle(fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                  right: BorderSide(color: Colors.grey))),
                          alignment: Alignment.center,
                          child: Text(
                            'Chi tiết chưa đến',
                            style: TextStyle(fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  getCsv() async {
    List<List<dynamic>> rows = List<List<dynamic>>();
    for (int i = 0; i < data.length; i++) {
      List<dynamic> row = List();
      row.add(i);
      row.add('nguyenduong$i@gmail.com');
      rows.add(row);
    }

    createFolder('storage/emulated/0/TOA.dms');
    createFolder('storage/emulated/0/TOA.dms/file');

    String dir = 'storage/emulated/0/TOA.dms/file/';
    String file = '$dir';
    DateTime time = DateTime.now();
    File f =
        new File(file + 'Route-${time.day}-${time.month}-${time.year}.csv');
    String csv = const ListToCsvConverter().convert(rows);

    f.writeAsString(csv.toString());
  }

  createFolder(String path) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    } else {
      final checkPath = Directory("$path");
      if ((await checkPath.exists())) {
        print("folder is exist");
      } else {
        checkPath.create();
        print('Create folder success');
      }
    }
  }
}
