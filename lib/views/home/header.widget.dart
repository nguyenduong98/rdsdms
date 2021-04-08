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
    double width = MediaQuery.of(context).size.width;

    return Positioned(
        child: Container(
      height: height < 500 ? height * 0.25 : height * 0.1,
      width: width,
      color: Colors.blue,
      child: Column(
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.topCenter,
            child: Text('Chào Nguyễn Thái Dương / NT000284',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ))
        ],
      ),
    ));
  }
}
