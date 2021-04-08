import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidget({Key key}) : super(key: key);

  @override
  createState() => NotificationWidgetState();
}

class NotificationWidgetState extends State<NotificationWidget> {
  List<int> listNotification = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Thông báo')),
      body: SingleChildScrollView(
        child: Container(
            height: height,
            width: width,
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: buildListNotifi()),
            )),
      ),
    ));
  }

  List<Widget> buildListNotifi() {
    return listNotification.map((item) => buildItemNotification()).toList();
  }

  Widget buildItemNotification() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: Colors.blue[200].withOpacity(0.4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100],
              offset: Offset(0.0, 0.0),
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Text('notification'),
    );
  }
}
