import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/constant/delivery.constant.dart';
import 'package:rdsdms/views/delivery/children-screen/visit-customer/image-customer.widget.dart';
import 'package:rdsdms/views/delivery/children-screen/visit-customer/info-customer.widget.dart';
import 'package:rdsdms/views/delivery/children-screen/visit-customer/rating.widget.dart';

class VisitCustomer extends StatefulWidget {
  VisitCustomer({Key key}) : super(key: key);

  @override
  createState() => VisitCustomerState();
}

class VisitCustomerState extends State<VisitCustomer>
    with TickerProviderStateMixin {
  TabController _tabController;
  bool statusCheckout = false;
  bool statusCheckIn = false;
  int currentTab = 0;

  _updateStatusCheckIn() {
    setState(() {
      statusCheckIn = true;
    });
    Timer(
        Duration(minutes: 1),
        () => setState(() {
              statusCheckout = true;
            }));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      print(statusCheckIn);
      if (_tabController.index == 0) {
        setState(() {
          currentTab = DeliveryConstant.customerTab;
        });
      } else if (_tabController.index == 1) {
        setState(() {
          currentTab = DeliveryConstant.imageTab;
        });
      } else {
        setState(() {
          currentTab = DeliveryConstant.ratingTab;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('Thăm khách hàng'),
              centerTitle: true,
              bottom: PreferredSize(
                  child: Container(
                    color: Colors.blue,
                    child: TabBar(
                      onTap: (index) {
                        if (statusCheckIn == false) {
                          setState(() {
                            _tabController.index = 0;
                          });
                        }
                      },
                      indicatorColor: Colors.red,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text('Khách hàng',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        Tab(
                          child: Text('Hình ảnh',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        Tab(
                          child: Text('Đánh giá',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        )
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(50.0)),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  currentTab == DeliveryConstant.customerTab
                      ? InfoCustomer(
                          statusCheckIn: statusCheckIn,
                          statusCheckout: statusCheckout,
                          checkIn: _updateStatusCheckIn,
                        )
                      : currentTab == DeliveryConstant.imageTab
                          ? ImageCustomer()
                          : Rating()
                ],
              ),
            )));
  }
}
