import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelOrderDetail extends StatefulWidget {
  CancelOrderDetail({Key key}) : super(key: key);

  @override
  createState() => CancelOrderDetailState();
}

class CancelOrderDetailState extends State<CancelOrderDetail> {
  List<int> data = [1, 2, 3, 1, 2, 3, 4, 5, 6];

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
              title: Text('Chi tiết đơn hàng'),
            ),
            body: GestureDetector(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey[200],
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          buildHeaderTable(),
                          ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              children: buildListProduct()),
                          buildGeneralOrder()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }

  Widget buildHeaderTable() {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                height: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                alignment: Alignment.center,
                child: Text('Sản phẩm',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              )),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child: Text('SL Đặt',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child: Text('Giá',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child: Text('Thành tiền',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildListProduct() {
    return data.map((item) => buildProduct(item)).toList();
  }

  Widget buildProduct(int item) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Text('Sản phẩm',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              )),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child: Text('10',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child: Text('2.700.000',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey))),
              alignment: Alignment.center,
              child: Text('21.111.111',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildGeneralOrder() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: Colors.grey[200],
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.only(bottom: width > 700 ? 50 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              'Tổng tiền: 79,775,000',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child:
                Text('Nhân viên: Test person', style: TextStyle(fontSize: 17)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('Khách hàng (C2): CÔNG TY TNHH TM SƠN HỮU PHÁT',
                style: TextStyle(fontSize: 17)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('Đại lý (C1): TOA', style: TextStyle(fontSize: 17)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('Thông tin giao hàng:', style: TextStyle(fontSize: 17)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('Ghi chú đơn hàng:', style: TextStyle(fontSize: 17)),
          )
        ],
      ),
    );
  }
}
