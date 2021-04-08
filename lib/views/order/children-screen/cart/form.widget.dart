import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text('Giao hàng tại:', style: TextStyle(fontSize: 16)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            margin: EdgeInsets.only(left: 20, top: 5),
            height: 45,
            width: width - 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(height: 1, color: Colors.black, fontSize: 25),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text('Ghi chú:', style: TextStyle(fontSize: 16)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            margin: EdgeInsets.only(left: 20, top: 5),
            height: 45,
            width: width - 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(height: 1, color: Colors.black, fontSize: 25),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.blue),
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              height: 45,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        height: 35,
                        width: 35,
                        child: Icon(AntDesign.back)),
                    Expanded(
                      flex: 9,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Chọn tiếp',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    )
                  ],
                ),
              )),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.blue),
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 45,
              child: InkWell(
                onTap: () {
                  print('Cập nhật đơn hàng');
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        height: 35,
                        width: 35,
                        child: Icon(AntDesign.reload1)),
                    Expanded(
                      flex: 9,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Cập nhật đơn hàng',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    )
                  ],
                ),
              )),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.blue),
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              height: 45,
              child: InkWell(
                onTap: () {
                  print('Đặt hàng');
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        height: 35,
                        width: 35,
                        child: Icon(AntDesign.check)),
                    Expanded(
                      flex: 9,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Đặt hàng',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
