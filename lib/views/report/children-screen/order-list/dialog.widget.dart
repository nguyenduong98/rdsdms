import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:rdsdms/constant/report.constant.dart';

class DialogWidget extends StatefulWidget {
  DialogWidget({Key key}) : super(key: key);

  @override
  createState() => DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  List<String> listProduct = [
    'Dương',
    'Nhi',
    'Tài',
    'Ý',
    'Khánh',
    'Thuận',
    'Quang',
    'Phong',
    'Trinh',
    'Trân',
    'Tân',
    'Hạnh',
    'An',
    'Ngọc',
    'Trung',
    'Tùng',
    'Hiển',
    'Linh'
  ];
  List<String> listProductFilter = [];
  List<String> listBeFound = [];
  List<String> listStatusOrder = [];

  bool reRender = false;
  bool keyboardStatus = false;
  String valueTextField = '';
  DateTime nowDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  DateTime selectedStartDate = DateTime.now();
  var txt = TextEditingController();

  _getProductByTextField(String value) {
    if (value == '') {
      setState(() {
        listBeFound = listProduct;
      });
    } else {
      listBeFound = [];
      listProduct.forEach((element) {
        if (element.contains(value) == true) {
          listBeFound.add(element);
        }
      });
      setState(() {
        reRender = true;
      });
    }
  }

  _getProductToFilter(String item) {
    final checkExist = listProductFilter.contains(item);
    if (checkExist == false) {
      listProductFilter.add(item);
    }
    setState(() {
      txt.text = '';
      listBeFound = listProduct;
      reRender = true;
    });
  }

  _deleteProductFilter(String item) {
    listProductFilter.removeWhere((element) => element == item);
    setState(() {
      reRender = true;
    });
  }

  _getStatusOrder(String item) {
    final index = listStatusOrder.indexWhere((element) => element == item);
    if (index == -1) {
      listStatusOrder.add(item);
    } else {
      listStatusOrder.removeWhere((element) => element == item);
    }
    setState(() {
      reRender = true;
    });
  }

  @override
  void initState() {
    super.initState();
    listBeFound = [...listProduct];
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          keyboardStatus = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      margin: EdgeInsets.only(bottom: 0),
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            buildSelectDate(),
            buildButtonSearch(),
            keyboardStatus == true
                ? AnimatedOpacity(
                    opacity: keyboardStatus ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.grey, width: 1),
                            right: BorderSide(color: Colors.grey, width: 1),
                            bottom: BorderSide(color: Colors.grey, width: 1)),
                      ),
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: buildListProduct()),
                    ),
                  )
                : AnimatedOpacity(
                    opacity: keyboardStatus == false ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 5000),
                    child: buildLitStatus(),
                  ),
            keyboardStatus == true ? Container() : buildButton()
          ],
        ),
      )),
    );
  }

  Widget buildSelectDate() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text('Từ ngày')),
            Expanded(
              child: Text('Đến Ngày'),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () async {
                final DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: selectedStartDate,
                    firstDate: DateTime(nowDate.year - 1),
                    lastDate: DateTime(2101));
                if (picked != null && picked != selectedStartDate) {
                  setState(() {
                    selectedStartDate = picked;
                  });
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(top: 10, right: width * 0.03),
                width: width,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(children: [
                  Expanded(
                      flex: 8,
                      child: Text(
                          '${selectedStartDate.day}/${selectedStartDate.month}/${selectedStartDate.year}',
                          style: TextStyle(fontSize: 20))),
                  Expanded(flex: 2, child: Icon(Icons.arrow_drop_down))
                ]),
              ),
            )),
            Expanded(
              child: InkWell(
                onTap: () async {
                  final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: selectedEndDate,
                      firstDate: selectedEndDate,
                      lastDate: DateTime(2101));
                  if (picked != null && picked != selectedEndDate)
                    setState(() {
                      selectedEndDate = picked;
                    });
                },
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(top: 10),
                    width: width,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Text(
                                '${selectedEndDate.day}/${selectedEndDate.month}/${selectedEndDate.year}',
                                style: TextStyle(fontSize: 20))),
                        Expanded(flex: 2, child: Icon(Icons.arrow_drop_down))
                      ],
                    )),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildButtonSearch() {
    double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 20),
        width: width * 0.9,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: Wrap(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Expanded(
                      flex: 9,
                      child: Container(
                        width: width * 0.2,
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: txt,
                          onChanged: (value) {
                            _getProductByTextField(value);
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nhập từ khóa ...'),
                          style: TextStyle(
                              height: 1, color: Colors.black, fontSize: 18),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            txt.text = '';
                            listBeFound = [...listProduct];
                          });
                        },
                      ))
                ],
              ),
            ),
            Wrap(
              children: listProductFilter
                  .map(
                    (item) => Container(
                        margin: EdgeInsets.only(left: 5),
                        child: RaisedButton.icon(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              _deleteProductFilter(item);
                            },
                            icon: Icon(Icons.close),
                            label: Text(item))),
                  )
                  .toList(),
            )
          ],
        ));
  }

  List<Widget> buildListProduct() {
    return listBeFound
        .asMap()
        .entries
        .map((item) => buildProduct(item.value, item.key))
        .toList();
  }

  Widget buildProduct(String item, int index) {
    return InkWell(
      onTap: () {
        _getProductToFilter(item);
      },
      child: Container(
        color:
            index % 2 == 0 ? Colors.grey[400].withOpacity(0.25) : Colors.white,
        padding: EdgeInsets.all(12),
        child: Text(item),
      ),
    );
  }

  Widget buildLitStatus() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black))),
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.topLeft,
          child: Text('Trạng thái đơn hàng',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Wrap(
            children: ReportConstant.orderStatus
                .map(
                  (item) => Container(
                      margin: EdgeInsets.only(right: 3),
                      child: RaisedButton(
                          color: listStatusOrder.indexWhere(
                                      (element) => element == item) ==
                                  -1
                              ? Colors.white
                              : Colors.blue,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey),
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            _getStatusOrder(item);
                          },
                          child: Text(item,
                              style: TextStyle(
                                  color: listStatusOrder.indexWhere(
                                              (element) => element == item) ==
                                          -1
                                      ? Colors.black
                                      : Colors.white)))),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  Widget buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 20),
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.black))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(right: 5),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.red,
              onPressed: () {
                print('Lọc');
              },
              child: Text('Lọc dữ liệu',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
          Container(
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
