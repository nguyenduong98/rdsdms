import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/home/header.widget.dart';
import 'package:rdsdms/views/home/statistics.widget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
    )));
  }
}
