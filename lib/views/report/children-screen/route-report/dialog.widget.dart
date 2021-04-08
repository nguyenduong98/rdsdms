import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  DialogWidget({Key key}) : super(key: key);

  @override
  createState() => DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

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
                        text: 'Từ ngày ',
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
              child: InkWell(
                onTap: () async {
                  final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: selectedStartDate,
                      firstDate: selectedStartDate,
                      lastDate: DateTime(2101));
                  if (picked != null && picked != selectedStartDate)
                    setState(() {
                      selectedStartDate = picked;
                    });
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 5),
                  margin: EdgeInsets.only(top: 10),
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                      'Ngày ${selectedStartDate.day} tháng ${selectedStartDate.month}, ${selectedStartDate.year}',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Đến ngày ',
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
              child: InkWell(
                onTap: () async {
                  final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: selectedEndDate,
                      firstDate: selectedEndDate,
                      lastDate: DateTime(2101));
                  if (picked != null && picked != selectedEndDate)
                    setState(() {
                      selectedEndDate = picked;
                    });
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 5),
                  margin: EdgeInsets.only(top: 10),
                  width: width,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                      'Ngày ${selectedEndDate.day} tháng ${selectedEndDate.month}, ${selectedStartDate.year}',
                      style: TextStyle(fontSize: 20)),
                ),
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
