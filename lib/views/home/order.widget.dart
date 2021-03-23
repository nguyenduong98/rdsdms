import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

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
      height: height * 0.2,
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
              flex: 3,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 5),
                width: width * 0.6,
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.blue[200]))),
                child: Text('ĐƠN HÀNG TRONG TUẦN',
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              )),
          Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('2',
                              style: TextStyle(
                                  color: Colors.blue[600], fontSize: 20)),
                          Text('Tổng đơn',
                              style: TextStyle(
                                  color: Colors.blue[600], fontSize: 20))
                        ],
                      )),
                  Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('2',
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 20)),
                          Text('Đang xử lý',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20))
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('0',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                          Text('Đã giao',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
