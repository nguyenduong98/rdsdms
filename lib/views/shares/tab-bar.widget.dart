import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/constant/home.constant.dart';

class TabBarWidget extends StatefulWidget {
  final Function updateTypeStatistic;

  TabBarWidget({@required this.updateTypeStatistic, Key key}) : super(key: key);

  @override
  createState() => TabBarWidgetState();
}

class TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 2) {
        widget.updateTypeStatistic(HomeConstant.statisticByMonth);
      } else {
        widget.updateTypeStatistic(HomeConstant.statisticByWeek);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(child: Text('Ngày', style: TextStyle(color: Colors.blue))),
            Tab(child: Text('Tuần', style: TextStyle(color: Colors.blue))),
            Tab(child: Text('Tháng', style: TextStyle(color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}
