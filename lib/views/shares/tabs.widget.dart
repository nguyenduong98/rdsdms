import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsWidget extends StatefulWidget {
  TabsWidget({Key key}) : super(key: key);

  @override
  createState() => TabsWidgetState();
}

class TabsWidgetState extends State<TabsWidget> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          bottom: height * 0.05, left: width * 0.05, right: width * 0.05),
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(child: Text('Ngày', style: TextStyle(color: Colors.black))),
            Tab(child: Text('Tuần', style: TextStyle(color: Colors.black))),
            Tab(child: Text('Tháng', style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
