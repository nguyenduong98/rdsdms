import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  Header({Key key}) : super(key: key);

  @override
  createState() => HeaderState();
}

class HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Positioned(
        child: Container(
      height: height * 0.2,
      color: Colors.blue.withOpacity(0.7),
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Text('RDS',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600)),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.headset,
                          color: Colors.white,
                        ),
                      ))
                ],
              )),
          Expanded(
              flex: 6,
              child: Container(
                child: Text('Chào Nguyễn Thái Dương / NT000284',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ))
        ],
      ),
    ));
  }
}
