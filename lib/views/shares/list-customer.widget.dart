import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rdsdms/views/customer/children-screen/edit-user.widget.dart';
import 'package:rdsdms/views/delivery/children-screen/visit-customer/visit-customer.widget.dart';
import 'package:rdsdms/views/delivery/map.widget.dart';

class ListCustomer extends StatefulWidget {
  final List<int> data;
  final String type;
  ListCustomer({@required this.data, @required this.type, Key key})
      : super(key: key);

  @override
  createState() => ListCustomerState();
}

class ListCustomerState extends State<ListCustomer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: buildListCustomer(widget.data)),
    );
  }

  List<Widget> buildListCustomer(List<int> data) {
    return data.map((item) => buildCustomer(item)).toList();
  }

  Widget buildCustomer(int item) {
    Color colorText = widget.type == 'user' ? Colors.black : Colors.red;
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 5),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 9,
              child: InkWell(
                onTap: () {
                  widget.type == 'user'
                      ? Get.to(EditCustomer())
                      : Get.to(VisitCustomer());
                },
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 10,
                            child: Container(
                                child: Text(
                                    'Nguyễn Thái Dương | 304921 | Orther B',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: colorText)))),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 10,
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.82,
                                    child: Text(
                                        '0987409903, 111 ABC, Phường 12, Quận Tân Bình, Hồ Chí minh',
                                        style: TextStyle(
                                            color: colorText, fontSize: 16),
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('Khoảng cách: 11,828,048m',
                          style: TextStyle(color: colorText, fontSize: 16)),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: IconButton(
                icon: widget.type == 'user'
                    ? Icon(
                        Icons.arrow_right,
                        size: 30,
                      )
                    : Icon(Icons.shopping_bag_outlined),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                            insetPadding: EdgeInsets.zero,
                            contentPadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            content: Builder(
                              builder: (context) {
                                var height = MediaQuery.of(context).size.height;
                                var width = MediaQuery.of(context).size.width;

                                return Container(
                                  height: height * 0.6,
                                  width: width * 0.8,
                                  padding: EdgeInsets.all(0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          width: double.infinity,
                                          child: Text(
                                            'Cập nhật vị trí',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 8,
                                          child: MapWidget(
                                            showAddress: false,
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 5),
                                                          child:
                                                              RaisedButton.icon(
                                                                  color: Colors
                                                                      .blue,
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'cập nhật');
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  icon:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                  ),
                                                                  label: Text(
                                                                      'Cập nhật',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white))))),
                                                  Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child:
                                                            OutlinedButton.icon(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  side: BorderSide(
                                                                      width:
                                                                          2.0,
                                                                      color: Colors
                                                                          .blue),
                                                                ),
                                                                onPressed: () {
                                                                  print('Đóng');
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                icon: Icon(Icons
                                                                    .cancel),
                                                                label: Text(
                                                                    'Đóng')),
                                                      ))
                                                ],
                                              )))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ));
                },
              ))
        ],
      ),
    );
  }
}
