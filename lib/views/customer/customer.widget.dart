import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import 'package:rdsdms/views/shares/list-customer.widget.dart';
import 'package:rdsdms/views/customer/children-screen/new-user.widget.dart';

class Customer extends StatefulWidget {
  Customer({Key key}) : super(key: key);

  @override
  createState() => CustomerState();
}

class CustomerState extends State<Customer> {
  final data = [1, 2, 3, 4, 5, 6, 7];

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
                title: Text('Danh sách khách hàng'),
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
                                    hintText: 'Tìm Khách hàng ...'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Feather.user_plus,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Get.to(NewUser());
                    },
                  )
                ]),
            body: SingleChildScrollView(
              child: Column(
                children: [ListCustomer(data: data, type: 'user')],
              ),
            )));
  }
}
