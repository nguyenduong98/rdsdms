import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Schedule extends StatefulWidget {
  Schedule({Key key}) : super(key: key);

  @override
  createState() => ScheduleState();
}

class ScheduleState extends State<Schedule> {
  DateTime selectedDate = DateTime.now();
  var txt = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Lộ trình làm việc'),
            ),
            body: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20, left: width * 0.05),
                    child: Row(
                      children: [
                        Text('Ngày đi tuyến', style: TextStyle(fontSize: 16)),
                        Text(' * ', style: TextStyle(color: Colors.red)),
                        Text(':')
                      ],
                    )),
                InkWell(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: selectedDate,
                        lastDate: DateTime(2101));
                    if (picked != null && picked != selectedDate)
                      setState(() {
                        selectedDate = picked;
                      });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(
                        top: 10, left: width * 0.05, right: width * 0.05),
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                        'Ngày ${selectedDate.day} tháng ${selectedDate.month}, ${selectedDate.year}',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: width * 0.05, right: width * 0.05, top: 20),
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      print('Danh sách khách hàng');
                    },
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child:
                                  Icon(Feather.refresh_ccw, color: Colors.blue),
                            )),
                        Expanded(
                            flex: 9,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Danh sách khách hàng',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 20, left: width * 0.05, right: width * 0.05),
                  child: Text(
                      'Vị trí của bạn: Phường 4, Thành Phố Hồ Chí Minh, Hồ Chí Minh, Việt Nam',
                      style: TextStyle(color: Colors.green[700], fontSize: 18)),
                ),
                Container(
                    margin: EdgeInsets.only(top: 5, left: width * 0.05),
                    alignment: Alignment.topLeft,
                    child: Text('Tuyến: Tuần 5 thứ 3',
                        style: TextStyle(fontSize: 18))),
                Container(
                  margin: EdgeInsets.only(top: 5, left: width * 0.05),
                  child: Row(
                    children: [
                      Text('Danh sách khách hàng',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      Text(' (0)')
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 20, left: width * 0.05, right: width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(0),
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Icon(Icons.search)),
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: txt,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Tìm Khách hàng ...'),
                          ),
                        ),
                      ),
                      Expanded(
                          child: IconButton(
                        onPressed: () {
                          txt.text = '';
                        },
                        icon: Icon(Icons.cancel),
                      ))
                    ],
                  ),
                )
              ],
            )));
  }
}
