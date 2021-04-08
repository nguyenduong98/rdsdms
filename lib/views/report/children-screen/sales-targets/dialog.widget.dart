import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  DialogWidget({Key key}) : super(key: key);

  @override
  createState() => DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  String year;
  String startMonth;
  String endMonth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      margin: EdgeInsets.only(bottom: 0),
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Năm ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                    TextSpan(text: ':', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (newValue) {
                  setState(() {
                    year = newValue;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Từ tháng ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                    TextSpan(text: ':', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (newValue) {
                  setState(() {
                    startMonth = newValue;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Đến tháng ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                    TextSpan(text: ':', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (newValue) {
                  setState(() {
                    endMonth = newValue;
                  });
                },
              ),
            ),
            buildButton()
          ],
        ),
      )),
    );
  }

  Widget buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(right: 5),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.red,
              onPressed: () {
                print('Lọc');
              },
              child: Text('Lọc dữ liệu',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
          Container(
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
