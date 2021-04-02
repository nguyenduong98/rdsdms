import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rdsdms/constant/customer.constant.dart';
import 'package:rdsdms/views/shares/list-checkbox.widget.dart';

class EditCustomer extends StatefulWidget {
  EditCustomer({Key key}) : super(key: key);

  @override
  createState() => EditCustomerState();
}

class EditCustomerState extends State<EditCustomer> {
  bool enableAccount = false;
  String customerGroup = CustomerConstant.customerGroup[0];
  String customerClassify = CustomerConstant.customerClassify[0];

  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

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
              title: Text('Cập nhật khách hàng'),
            ),
            body: Container(
                width: width,
                padding: EdgeInsets.only(
                    left: width * 0.05, right: width * 0.05, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Build General information of customer
                      Container(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Mã khách hàng:',
                                  style: TextStyle(fontSize: 16)),
                              TextSpan(
                                text: ' 300079.test',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                              'Tên khách hàng: CONG TY TNHH TRANG TRI NOI THAT HOANG MANH',
                              style: TextStyle(fontSize: 16))),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                            'Địa chỉ: 838 Trường chinh, Phường 15, Quận Tân Bình, TP. Hồ Chí Minh',
                            style: TextStyle(fontSize: 16)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Liên hệ: HUYNH NGA / 0334 058 102',
                            style: TextStyle(fontSize: 16)),
                      ),
                      // Build Dropdown Customer Group
                      buildTitle('Nhóm khách hàng', 20),
                      buildDropDown(CustomerConstant.customerGroup,
                          customerGroup, CustomerConstant.isCustomerGroup),
                      // Build Dropdown Customer Classify
                      buildTitle('Phân loại khách hàng (XS, S, M, L, XL)', 20),
                      buildDropDown(
                          CustomerConstant.customerClassify,
                          customerClassify,
                          CustomerConstant.isCustomerClassify),
                      // Build Old Text Customer Classify
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Phân loại cũ: ',
                                  style: TextStyle(fontSize: 18)),
                              TextSpan(
                                text: 'S: từ 300 triệu đến dưới 1,2 tỷ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Build List Checkbox Sign
                      Container(
                        width: width,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Text('Bảng hiểu',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            ListCheckbox(data: data)
                          ],
                        ),
                      ),
                      // Bull  List CheckBox Machine
                      Container(
                        width: width,
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Text('Máy pha màu',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            ListCheckbox(data: data)
                          ],
                        ),
                      ),
                      // Build List checkbox shelves
                      Container(
                        width: width,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Text('Kệ trưng bày',
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            ListCheckbox(data: data)
                          ],
                        ),
                      ),
                      // Build Checkbox Type Account
                      Container(
                          child: Transform.scale(
                        scale: 1,
                        child: CheckboxListTile(
                          title: Text("Ngưng hoạt động",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                          value: enableAccount,
                          onChanged: (newValue) {
                            setState(() {
                              enableAccount = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      )),
                      // Build Button Submit
                      Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 35,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Icon(Icons.check),
                                    )),
                                Expanded(
                                  flex: 9,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Lưu khách hàng',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ))));
  }

  Widget buildTitle(String title, double marginTop) {
    return Container(
        margin: EdgeInsets.only(top: marginTop),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: title, style: TextStyle(fontSize: 18)),
              TextSpan(
                text: ' *',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18),
              ),
              TextSpan(text: ':', style: TextStyle(fontSize: 18))
            ],
          ),
        ));
  }

  Widget buildDropDown(List<String> data, String value, bool typeDropDown) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(value,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          items: data.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              if (typeDropDown == true) {
                setState(() {
                  customerGroup = newValue;
                });
              } else {
                setState(() {
                  customerClassify = newValue;
                });
              }
            });
          },
        ),
      ),
    );
  }
}
