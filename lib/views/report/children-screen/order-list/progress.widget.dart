import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDelivery extends StatefulWidget {
  final int data;
  ProgressDelivery({@required this.data, Key key}) : super(key: key);

  @override
  createState() => ProgressDeliveryState();
}

class ProgressDeliveryState extends State<ProgressDelivery> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue[500],
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                Container(
                    color: Colors.blue[900], height: 1, width: width * 0.25),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue[500],
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                Container(
                    color: Colors.blue[900], height: 1, width: width * 0.25),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue[500],
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ],
            )),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child:
                        Text('NHẬN ĐƠN', style: TextStyle(color: Colors.blue)),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('NGÀY GIAO DỰ KIẾN',
                        style: TextStyle(color: Colors.blue)),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child:
                        Text('ĐÃ GIAO', style: TextStyle(color: Colors.blue)),
                  ))
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('30.3.2021',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('30.3.2021',
                        style: TextStyle(
                            color: widget.data == 3 ? Colors.red : Colors.blue,
                            fontWeight: FontWeight.bold)),
                  )),
              Expanded(flex: 2, child: Container())
            ],
          ),
        )
      ],
    );
  }
}
