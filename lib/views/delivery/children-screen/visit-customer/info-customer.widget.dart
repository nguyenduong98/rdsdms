import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    print('Tiếp tuc đặt hàng');
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
              width: width,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Khách hàng:', style: TextStyle(fontSize: 16)),
                    TextSpan(
                      text: ' CỬA HÀNG THỊNH VƯỢNG',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
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
                  margin: EdgeInsets.only(top: 30),
                  child: RaisedButton.icon(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: Colors.grey)),
                      onPressed: () {
                        widget.checkIn();
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(5),
                        child: Icon(Icons.check, color: Colors.blue),
                      ),
                      label: Text('Check in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width < 600 ? 14 : 18))),
                )
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
                  RaisedButton.icon(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: Colors.grey)),
                      onPressed: widget.statusCheckout == false
                          ? null
                          : () => _checkout(),
                      icon: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(5),
                        child: Icon(Icons.check, color: Colors.blue),
                      ),
                      label: Text('Check out',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width < 600 ? 14 : 18))),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: RaisedButton.icon(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.grey)),
                        onPressed: () {
                          _goOnOrder();
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.all(5),
                          child: Icon(Icons.shopping_bag, color: Colors.blue),
                        ),
                        label: Text('Tiếp tục đặt hàng',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width < 600 ? 14 : 18))),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
