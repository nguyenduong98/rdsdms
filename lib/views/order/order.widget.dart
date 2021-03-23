import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/home/header.widget.dart';
import 'package:rdsdms/views/home/statistics.widget.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  @override
  createState() => OrderState();
}

class OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Text('Order'),
    )));
  }
}
