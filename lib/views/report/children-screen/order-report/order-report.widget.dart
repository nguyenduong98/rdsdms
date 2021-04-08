import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:rdsdms/views/report/children-screen/order-report/dialog.widget.dart';

class OrderReport extends StatefulWidget {
  OrderReport({Key key}) : super(key: key);

  @override
  createState() => OrderReportState();
}

class OrderReportState extends State<OrderReport> {
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
                title: Text('Thống kê đơn hàng'),
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
                            children: buildListOrder(data)),
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
              height: 60,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              alignment: Alignment.center,
              child:
                  Text('Ngày', style: TextStyle(fontWeight: FontWeight.w600)),
            )),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey))),
                    alignment: Alignment.center,
                    child: Text('Đơn hàng',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Colors.grey),
                                bottom: BorderSide(color: Colors.grey))),
                        alignment: Alignment.center,
                        child: Text('Số lương',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      )),
                  Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text('Giá trị',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ))
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child:
                Text('Đã hủy', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        )
      ],
    );
  }

  List<Widget> buildListOrder(List<int> data) {
    return data.map((item) => buildOrder(item)).toList();
  }

  Widget buildOrder(int item) {
    return Container(
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
              child: Text('12/10/2021'),
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
              child: Text('10'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey),
              )),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('110.000.000'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('5'),
            ),
          )
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
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey),
              )),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('110.000.000',
                  style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Text('5', style: TextStyle(fontWeight: FontWeight.w800)),
            ),
          )
        ],
      ),
    );
  }
}
