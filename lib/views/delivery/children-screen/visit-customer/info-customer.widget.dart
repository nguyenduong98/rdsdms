import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:get/get.dart';

import 'package:rdsdms/views/order/children-screen/agency/agency.widget.dart';

class InfoCustomer extends StatefulWidget {
  final bool statusCheckout;
  final bool statusCheckIn;
  final Function checkIn;
  InfoCustomer(
      {@required this.statusCheckout,
      @required this.checkIn,
      @required this.statusCheckIn,
      Key key})
      : super(key: key);

  @override
  createState() => InfoCustomerState();
}

class InfoCustomerState extends State<InfoCustomer> {
  _checkout() {
    print('checkout');
  }

  _goOnOrder() {
    Get.to(Agency());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Khách hàng: ',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                              text: 'CỬA HÀNG THỊNH VƯỢNG',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text('(300101.test)', style: TextStyle(fontSize: 17)),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: 20),
            color: Colors.orange[100],
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 6,
                        child:
                            Text('Check-in:', style: TextStyle(fontSize: 18))),
                    Expanded(
                        flex: 4,
                        child: Text('09:41',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Text('Check-out (dự kiến):',
                              style: TextStyle(fontSize: 18))),
                      Expanded(
                          flex: 4,
                          child: Text('09:41',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)))
                    ],
                  ),
                )
              ],
            ),
          ),
          widget.statusCheckIn == false
              ? Container(
                  width: width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue),
                  margin: EdgeInsets.only(left: width * 0.05, top: 20),
                  height: 45,
                  child: InkWell(
                    onTap: () {
                      widget.checkIn();
                    },
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5),
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
                            child: Text('Check in ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width < 350 ? 15 : 20)),
                          ),
                        )
                      ],
                    ),
                  ))
              : Container(),
          widget.statusCheckIn == true
              ? Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: width * 0.05, top: 20),
                      child: Text('Nội dung làm việc:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05, top: 10),
                        child: TextField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            contentPadding: EdgeInsets.all(8),
                          ),
                        )),
                  ],
                )
              : Container(),
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.statusCheckout == false
                              ? Colors.grey
                              : Colors.blue),
                      height: 45,
                      child: InkWell(
                        onTap: widget.statusCheckout == false
                            ? null
                            : () => _checkout(),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 5),
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
                                child: Text('Check out',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width < 350 ? 15 : 20)),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      width: width * 0.51,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.statusCheckout == false
                              ? Colors.grey
                              : Colors.blue),
                      margin: EdgeInsets.only(left: 5),
                      height: 45,
                      child: InkWell(
                        onTap: widget.statusCheckout == false
                            ? null
                            : () => _goOnOrder(),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 5),
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
                                child: Text('Tiếp tục đặt hàng',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width < 350 ? 15 : 18)),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
