import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:rdsdms/views/order/children-screen/product/product.widget.dart';

class Agency extends StatefulWidget {
  Agency({Key key}) : super(key: key);

  @override
  createState() => AgencyState();
}

class AgencyState extends State<Agency> {
  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    3,
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text('Đại lý duyệt đơn hàng (c1)'),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: Container(
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Icon(Icons.search))),
                          Expanded(
                            flex: 9,
                            child: Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    hintText: 'Tìm đại lý ...'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            body: Container(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: buildListAgency()),
            )));
  }

  List<Widget> buildListAgency() {
    return data.map((item) => buildAgency()).toList();
  }

  Widget buildAgency() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 4, bottom: 4),
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
      padding:
          EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: 10),
      child: InkWell(
        onTap: () {
          Get.to(Product());
        },
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10),
                child: Text('TOA',
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(
                          FontAwesome.map_marker,
                          size: 15,
                          color: Colors.green,
                        )),
                    Expanded(
                        flex: 9,
                        child: Text(
                          'Tầng 8, Phòng 8.5, Tòa nhà Etown 3, 364 Cộng Hòa, Phường 13, Tân Bình',
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
