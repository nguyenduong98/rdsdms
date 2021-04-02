import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCheckbox extends StatefulWidget {
  final List<int> data;
  ListCheckbox({@required this.data, Key key}) : super(key: key);

  @override
  createState() => ListCheckboxState();
}

class ListCheckboxState extends State<ListCheckbox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heightOfItem = 45;
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: (width * 0.5 / heightOfItem),
        crossAxisCount: 2,
        children:
            widget.data.map((item) => CheckboxWidget(data: item)).toList(),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  final int data;
  CheckboxWidget({@required this.data, Key key}) : super(key: key);

  @override
  createState() => CheckboxWidgetState();
}

class CheckboxWidgetState extends State<CheckboxWidget> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Checkbox(
            value: status,
            onChanged: (value) {
              setState(() {
                status = value;
              });
            },
          ),
        ),
        Expanded(
            flex: 7,
            child: Container(
              child: Text('Title text'),
            ))
      ],
    ));
  }
}
