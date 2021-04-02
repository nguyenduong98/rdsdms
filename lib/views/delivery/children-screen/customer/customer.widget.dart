import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import 'package:rdsdms/views/delivery/children-screen/schedule/schedule.widget.dart';
import 'package:rdsdms/views/shares/list-customer.widget.dart';

class Customer extends StatefulWidget {
  Customer({Key key}) : super(key: key);

  @override
  createState() => CustomerState();
}

class CustomerState extends State<Customer> with TickerProviderStateMixin {
  TabController _tabController;
  var txt = TextEditingController();

  List<int> dataMock = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text('Lộ trình làm việc'),
            centerTitle: true,
            bottom: PreferredSize(
                child: Container(
                  color: Colors.blue,
                  child: TabBar(
                    indicatorColor: Colors.red,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text('Trong tuyến',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      Tab(
                        child: Text('Ngoại tuyến',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      )
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(50.0)),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Ionicons.md_calendar,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Get.to(Schedule());
                },
              )
            ]),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Vị trí của bạn: 157 Xuân Hồng, Phường 12, Quận Tân Bình, Tp.Hồ Chí Minh',
                          style: TextStyle(color: Colors.green, fontSize: 16)),
                      Row(children: [
                        Text('Tuyến:',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                        Text(' Tuần 4 thứ 6', style: TextStyle(fontSize: 16))
                      ]),
                      Row(children: [
                        Text('Danh sách khách hàng',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                        Text(' (trong bán kính 2000m)',
                            style: TextStyle(fontSize: 12))
                      ]),
                      Row(
                        children: [
                          Text('Đã đến:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)),
                          Text(' 0 / 0', style: TextStyle(fontSize: 16))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
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
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(top: 5, left: 10),
                            child: Icon(Icons.search),
                          )),
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
                ),
                ListCustomer(data: dataMock, type: 'delivery')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
