import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rdsdms/views/delivery/delivery.widget.dart';
import 'package:rdsdms/views/home/header.widget.dart';
import 'package:rdsdms/views/home/statistics.widget.dart';
import 'package:rdsdms/views/order/order.widget.dart';
import 'package:rdsdms/views/report/report.widget.dart';
import 'package:rdsdms/views/customer/customer.widget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  createState() => HomeState();
}

class HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, size: 30, color: Colors.blue[900]),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        elevation: 0,
        actions: <Widget>[
          Stack(
            children: [
              Positioned(
                child: Card(
                  color: Colors.white.withOpacity(0),
                  elevation: 0,
                  child: Container(
                    height: 20,
                    margin: EdgeInsets.only(left: 30, top: 5),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Text('10', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                  child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  print('Notification');
                },
              ))
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.headset,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('Headphone');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Stack(
            children: [
              Header(),
              Statistics(),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                          'https://i.pinimg.com/564x/6f/6c/15/6f6c1538b050072b002dbc06bedaaf90.jpg',
                          fit: BoxFit.fill),
                    )),
                    Positioned(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  height: 70,
                                  child: Image.network(
                                    'https://i.pinimg.com/736x/71/85/01/718501440c346df26c169b30751f5331.jpg',
                                    fit: BoxFit.cover,
                                    scale: 1.0,
                                  ),
                                ),
                              ),
                            )),
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nguyễn Thái Dương',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16)),
                              Text('nguyenduong18061998@gmail.com',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title:
                    Text('Lộ trình làm việc', style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/visitout-icon.png'),
                onTap: () {
                  Get.to(Delivery());
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title: Text('Đơn hàng ngoại tuyến',
                    style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/order-icon.png'),
                onTap: () {
                  Get.to(Order());
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title: Text('Danh sách khách hàng',
                    style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/newshoplist-icon.png'),
                onTap: () {
                  Get.to(Customer());
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title: Text('Nhà thầu chuyên nghiệp sơn TOA',
                    style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/tpc-icon.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title: Text('Báo cáo', style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/report-icon.png'),
                onTap: () {
                  Get.to(Report());
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title: Text('Đăng ký thiết bị', style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/device-icon.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title: Text('Thoát', style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/close-icon.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                title: Text('Đơn hàng bán lẻ', style: TextStyle(fontSize: 16)),
                leading: Image.asset('assets/icons/order-enduser.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
