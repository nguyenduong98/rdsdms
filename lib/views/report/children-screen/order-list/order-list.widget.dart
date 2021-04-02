import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:rdsdms/views/report/children-screen/order-list/dialog.widget.dart';

import 'package:rdsdms/views/report/children-screen/order-list/progress.widget.dart';

class OrderList extends StatefulWidget {
  OrderList({Key key}) : super(key: key);

  @override
  createState() => OrderListState();
}

class OrderListState extends State<OrderList> {
  List<int> data = [1, 2, 3, 1, 2, 3, 4, 5, 6];
  List<String> list = [
    'Dương',
    'Nhi',
    'Tài',
    'Ý',
    'Khánh',
    'Thuận',
    'Quang',
    'Phong'
  ];
  List<String> listKey = [];
  List<String> listBeFound = [];
  List<String> listKeyToFilter = [];
  bool reRender = false;
  String valueTextField = '';
  DateTime nowDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  DateTime selectedStartDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text('Danh sách đơn hàng'),
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
            body: SingleChildScrollView(
              child: Container(
                color: Colors.grey[300],
                child: Column(
                  children: [
                    buildGeneralInfo(),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: buildListOrder()),
                    )
                  ],
                ),
              ),
            )));
  }

  Widget buildGeneralInfo() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('Thời gian: 01.03 - 31.03 / Hệ thống: Big C',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('TỔNG PO: 68',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  margin: EdgeInsets.only(
                      left: width * 0.1, right: width * 0.02, top: 10),
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Đang xử lý:',
                            style: TextStyle(fontSize: 16)),
                        TextSpan(
                          text: ' 68',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                      left: width * 0.02, right: width * 0.1, top: 10),
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Đã giao hàng:',
                            style: TextStyle(fontSize: 16)),
                        TextSpan(
                          text: ' 42',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ))
              ]),
          Container(
              width: width * 0.9,
              margin: EdgeInsets.only(top: 20),
              height: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 6.0,
                ),
              ], color: Colors.white, border: Border.all(color: Colors.grey)),
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
                              hintText: 'Tìm đơn hàng, khách hàng, số PO ...'),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> buildListOrder() {
    return data.map((item) => buildOrder(item)).toList();
  }

  Widget buildOrder(int item) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      margin: EdgeInsets.only(top: 15, left: width * 0.02, right: width * 0.02),
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
                              color: Colors.blue[900], fontSize: 18))),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('Big C',
                        style:
                            TextStyle(color: Colors.blue[900], fontSize: 16)),
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
            ProgressDelivery(data: item),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
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
                          margin: EdgeInsets.only(left: 25),
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
    );
  }

  _showFilter() {
    double height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              insetPadding:
                  EdgeInsets.only(bottom: height * 0.13, left: 10, right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  return buildContentFilter();
                },
              ),
            ));
  }

  Widget buildContentFilter() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.6,
      width: width * 0.95,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text('Từ ngày')),
                Expanded(
                  child: Text('Đến Ngày'),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: selectedStartDate,
                        firstDate: DateTime(nowDate.year - 1),
                        lastDate: DateTime(2101));
                    if (picked != null && picked != selectedStartDate) {
                      setState(() {
                        selectedStartDate = picked;
                      });
                      _showFilter();
                    }
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(top: 10, right: width * 0.03),
                    width: width,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(children: [
                      Expanded(
                          flex: 8,
                          child: Text(
                              '${selectedStartDate.day}/${selectedStartDate.month}/${selectedStartDate.year}',
                              style: TextStyle(fontSize: 20))),
                      Expanded(flex: 2, child: Icon(Icons.arrow_drop_down))
                    ]),
                  ),
                )),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime picked = await showDatePicker(
                          context: context,
                          initialDate: selectedEndDate,
                          firstDate: selectedEndDate,
                          lastDate: DateTime(2101));
                      if (picked != null && picked != selectedEndDate)
                        setState(() {
                          selectedEndDate = picked;
                        });
                      _showFilter();
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(top: 10),
                        width: width,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 8,
                                child: Text(
                                    '${selectedEndDate.day}/${selectedEndDate.month}/${selectedEndDate.year}',
                                    style: TextStyle(fontSize: 20))),
                            Expanded(
                                flex: 2, child: Icon(Icons.arrow_drop_down))
                          ],
                        )),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 20),
              width: width * 0.9,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Stack(
                children: [
                  Positioned(
                      child: Wrap(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 9,
                                child: Container(
                                  width: width * 0.2,
                                  padding: EdgeInsets.only(left: 5, top: 10),
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: TextEditingController()
                                      ..text = valueTextField,
                                    onChanged: (value) {
                                      list.forEach((element) {
                                        if (element.contains(value) == true) {
                                          listBeFound.add(element);
                                        }
                                        print(listBeFound.length);
                                      });

                                      setState(() {
                                        valueTextField = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText: 'Nhập từ khóa ...'),
                                    style: TextStyle(
                                        height: 1,
                                        color: Colors.black,
                                        fontSize: 18),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    print('xóa');
                                  },
                                ))
                          ],
                        ),
                      ),
                      Wrap(
                        children: listKey
                            .map(
                              (e) => Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: RaisedButton.icon(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        print('delete');
                                      },
                                      icon: Icon(Icons.close),
                                      label: Text('KINGFOOD'))),
                            )
                            .toList(),
                      )
                    ],
                  )),
                  Positioned(
                      child: Container(
                    width: double.infinity,
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
                    margin: EdgeInsets.only(top: 40),
                    child: Wrap(
                      children: listBeFound
                          .map(
                            (e) => Container(
                                margin: EdgeInsets.only(left: 5),
                                child: RaisedButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    print('add');
                                  },
                                  child: Text('Dương'),
                                )),
                          )
                          .toList(),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
