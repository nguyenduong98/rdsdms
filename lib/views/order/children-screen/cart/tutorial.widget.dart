import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget {
  Tutorial({Key key}) : super(key: key);

  @override
  createState() => TutorialState();
}

class TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 6.0,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[400],
      ),
      margin: EdgeInsets.only(top: 20),
      child: ExpandablePanel(
        header: Container(
          height: 50,
          padding: EdgeInsets.all(10),
          child: Text(
            "Hướng dẫn đặt hàng",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        expanded: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5)),
            color: Colors.white,
          ),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.topCenter,
                          child: Text('1. ',
                              style: TextStyle(
                                  color: Colors.green[900], fontSize: 16))),
                    ),
                    Expanded(
                      flex: 9,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Để thêm sản phẩm nhấn nút ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[900])),
                            TextSpan(
                              text: '"Chọn tiêp"',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900],
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: Text('2. ',
                                style: TextStyle(
                                    color: Colors.green[900], fontSize: 16)))),
                    Expanded(
                      flex: 9,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Để hủy sản phẩm đã đặt nhấn vào ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[900])),
                            TextSpan(
                              text: '"Icon xóa"',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900],
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.topCenter,
                          child: Text('3. ',
                              style: TextStyle(
                                  color: Colors.green[900], fontSize: 16)))),
                  Expanded(
                      flex: 9,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Nhập vào địa chỉ giao hàng vào ô ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[900])),
                            TextSpan(
                              text: '"Giao hàng tại" ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900],
                                  fontSize: 16),
                            ),
                            TextSpan(
                                text:
                                    'để báo thông tin giao hàng trên đơn hàng',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[900]))
                          ],
                        ),
                      ))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.topCenter,
                          child: Text('4. ',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.green[900])))),
                  Expanded(
                      flex: 9,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Nhấn nút ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[900])),
                            TextSpan(
                              text: '"Cập nhật đơn hàng" ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900],
                                  fontSize: 16),
                            ),
                            TextSpan(
                                text: 'để cập nhật số lượng đã điều chỉnh',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[900]))
                          ],
                        ),
                      ))
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: Text('5. ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[900])))),
                    Expanded(
                        flex: 9,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Nhấn nút ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green[900])),
                              TextSpan(
                                text: '"Đặt hàng" ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[900],
                                    fontSize: 16),
                              ),
                              TextSpan(
                                  text: 'để gửi đơn hàng',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green[900]))
                            ],
                          ),
                        ))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
