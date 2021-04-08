import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rdsdms/views/report/children-screen/cancel-order-detail/cancel-order-detail.widget.dart';

class CancelOrderList extends StatefulWidget {
  CancelOrderList({Key key}) : super(key: key);

  @override
  createState() => CancelOrderListState();
}

class CancelOrderListState extends State<CancelOrderList> {
  List<int> data = [1, 2, 3, 1, 2, 3, 4, 5, 6];

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
                title: Text('Đơn hàng đã hủy'),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: Container(
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Icon(Icons.search))),
                          Expanded(
                            flex: 9,
                            child: Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    hintText: 'Tìm Khách hàng ...'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            body: GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                children: buildListOrder()))
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  List<Widget> buildListOrder() {
    return data.map((item) => buildOrder(item)).toList();
  }

  Widget buildOrder(int item) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
          Get.to(CancelOrderDetail());
        },
        child: Container(
          width: width * 0.9,
          margin:
              EdgeInsets.only(top: 15, left: width * 0.02, right: width * 0.02),
          padding: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 6.0,
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.red),
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.yellow, width: 1))),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text('2113039845197',
                              style: TextStyle(
                                  color: Colors.blue[900], fontSize: 17))),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Text('Big C',
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 16)),
                      ))
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text('Giao đến: Big C Tan Thanh',
                        style: TextStyle(fontSize: 16))),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('NVGH: Lương Vinh Quang',
                      style: TextStyle(fontSize: 16)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 8,
                          child: Container(
                            child: Text(
                              'Tổng ĐH: 11,048637',
                              style: TextStyle(fontSize: 17),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: IconButton(
                            onPressed: () {
                              print('delete');
                            },
                            icon: Container(
                              margin:
                                  EdgeInsets.only(left: width < 350 ? 15 : 25),
                              padding: EdgeInsets.all(width < 600 ? 0 : 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red,
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
