import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/delivery/map.widget.dart';

class Delivery extends StatefulWidget {
  Delivery({Key key}) : super(key: key);

  @override
  createState() => DeliveryState();
}

class DeliveryState extends State<Delivery> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Check-in vị trí của bạn'),
            ),
            body: MapWidget(
              showAddress: true,
            )));
  }
}
