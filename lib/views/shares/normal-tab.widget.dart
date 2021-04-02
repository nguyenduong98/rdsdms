import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalTab extends StatefulWidget {
  NormalTab({Key key}) : super(key: key);

  @override
  createState() => NormalTabState();
}

class NormalTabState extends State<NormalTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: width * 0.1),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.blue))),
                child: Text('LỘ TRÌNH LÀM VIỆC',
                    style: TextStyle(color: Colors.blue)),
              )),
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(right: width * 0.1),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.orange))),
                child: Text('BÁN HÀNG', style: TextStyle(color: Colors.orange)),
              ))
        ],
      ),
    );
  }
}
