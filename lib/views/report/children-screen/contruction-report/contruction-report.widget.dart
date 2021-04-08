import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:rdsdms/views/report/children-screen/contruction-report/dialog.widget.dart';

class ContructionReport extends StatefulWidget {
  ContructionReport({Key key}) : super(key: key);

  @override
  createState() => ContructionReportState();
}

class ContructionReportState extends State<ContructionReport> {
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
                            children: buildListData(data)),
                        buildSum()
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
          flex: 3,
          child: Container(
            height: 40,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            alignment: Alignment.center,
            child: Text('Ngày', style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                    right: BorderSide(color: Colors.grey))),
            padding: EdgeInsets.only(right: 5),
            alignment: Alignment.center,
            child: Text('Số lần thăm',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
            )),
            padding: EdgeInsets.only(right: 5),
            alignment: Alignment.center,
            child: Text('Công trình đã thăm',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
          ),
        ),
      ],
    );
  }

  List<Widget> buildListData(List<int> data) {
    return data.map((item) => buildData(item)).toList();
  }

  Widget buildData(int item) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 5),
              child: SingleChildScrollView(
                child: Text('Thực phẩm chức năng ABCXYD'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('10'),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey),
              )),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('110.000.000'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSum() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child:
                  Text('Tổng', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('10', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey),
              )),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('20', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }
}
