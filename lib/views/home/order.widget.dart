import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/shares/tab-bar.widget.dart';
import 'package:rdsdms/views/shares/normal-tab.widget.dart';

class Order extends StatefulWidget {
  final Function updateTypeStatistic;

  Order({@required this.updateTypeStatistic, Key key}) : super(key: key);

  @override
  createState() => OrderState();
}

class OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.96,
      height: height * 0.25,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 0.5),
          blurRadius: 6.0,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  padding: EdgeInsets.only(right: width * 0.3, left: 20),
                  width: width,
                  child: TabBarWidget(
                    updateTypeStatistic: widget.updateTypeStatistic,
                  ))),
          Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  width: width,
                  child: NormalTab())),
          Expanded(
              flex: 4,
              child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('5',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 20)),
                              Text('KH đã đến',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 18))
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Colors.blue),
                                    right: BorderSide(color: Colors.blue))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('10',
                                    style: TextStyle(
                                        color: Colors.blue[600], fontSize: 20)),
                                Text('kế hoạch',
                                    style: TextStyle(
                                        color: Colors.blue[600], fontSize: 18))
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('1',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20)),
                              Text('1.000.000.000đ',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18)),
                            ],
                          ))
                    ],
                  )))
        ],
      ),
    );
  }
}
