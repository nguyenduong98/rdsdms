import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';

import 'package:rdsdms/constant/customer.constant.dart';

class NewUser extends StatefulWidget {
  NewUser({Key key}) : super(key: key);

  @override
  createState() => NewUserState();
}

class NewUserState extends State<NewUser> {
  String name;
  String phonenumber;
  String contact;
  String apartmentNumber;
  String road;
  String ward;
  String license;
  String customerGroup = CustomerConstant.customerGroup[0];
  String customerClassify = CustomerConstant.customerClassify[0];

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
              title: Text('Thêm mới user'),
            ),
            body: Container(
                width: width,
                padding: EdgeInsets.only(
                    left: width * 0.05, right: width * 0.05, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Build Textfield Name
                      buildTitle('Tên Khách hàng', 0),
                      buildTextField(name, 1),
                      buildMoreRequire('Nhập chữ HOA không dấu'),
                      // Build Dropdown Group Customer
                      buildTitle('Nhóm khách hàng', 20),
                      buildDropDown(CustomerConstant.customerGroup,
                          customerGroup, CustomerConstant.isCustomerGroup),
                      // Build Dropdown Customer Classify
                      buildTitle('Phân loại khách hàng', 20),
                      buildDropDown(
                          CustomerConstant.customerClassify,
                          customerClassify,
                          CustomerConstant.isCustomerClassify),
                      // Build Textfield phonenumber
                      buildTitle('Số điện thoại', 20),
                      buildTextField(phonenumber, 2),
                      buildMoreRequire('Ghi rõ mã vùng (điện thoại bàn)'),
                      // Build Textfield contact
                      buildTitle('Người liên hệ', 20),
                      buildTextField(contact, 3),
                      // Build Textfield apartment number
                      buildTitle('Số nhà', 20),
                      buildTextField(apartmentNumber, 4),
                      buildMoreRequire(
                          'Phải ghi rõ Số/Sạp/Ki-ốt/Khóm/Ấp/Kẹt/Kiệt/Ngã/Ngõ/Ngách/Góc/Số tầng/Lô/Tòa nhà'),
                      // Build Textfield road
                      buildTitle('Đường', 20),
                      buildTextField(road, 5),
                      buildMoreRequire(
                          'Phải ghi rõ, nếu tên đường/chợ là số hoặc vừa số, vừa chữ (Ví dụ: Đường 30/4, Đường D2, Chợ số 4)'),
                      // Build Textfield ward
                      buildTitle('Phường', 20),
                      buildTextField(ward, 6),
                      buildMoreRequire('Phải ghi rõ Phường/Xã thị trấn'),
                      // Build Dropdown Provincial
                      buildTitle('Tỉnh/TP', 20),
                      buildDropDown(
                          CustomerConstant.customerClassify,
                          customerClassify,
                          CustomerConstant.isCustomerClassify),
                      // Build Dropdown Provincial
                      buildTitle('Quận/Huyện', 20),
                      buildDropDown(
                          CustomerConstant.customerClassify,
                          customerClassify,
                          CustomerConstant.isCustomerClassify),
                      // Build Textfield registration license
                      buildTitle('Địa chỉ trên giấy phép ĐKKD', 20),
                      buildTextField(license, 7),
                      buildMoreRequire(
                          'Ghi đầy đủ địa chỉ bao gồm cả Quận/Huyện và Tỉnh/TP'),
                      // Build Button
                      Container(
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue),
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          height: 45,
                          child: InkWell(
                            onTap: () {
                              print('lưu khách hàng');
                            },
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 35,
                                    width: 35,
                                    child: Icon(AntDesign.check)),
                                Expanded(
                                  flex: 9,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Lưu khách hàng',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
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
                text: '* ',
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

  Widget buildTextField(String value, int type) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        onChanged: (newValue) {
          switch (type) {
            case 1:
              setState(() {
                name = newValue;
              });
              break;
            case 2:
              setState(() {
                phonenumber = newValue;
              });
              break;
            case 3:
              setState(() {
                contact = newValue;
              });
              break;
            case 4:
              setState(() {
                apartmentNumber = newValue;
              });
              break;
            case 5:
              setState(() {
                road = newValue;
              });
              break;
            case 6:
              setState(() {
                ward = newValue;
              });
              break;
            case 7:
              setState(() {
                license = newValue;
              });
              break;
            default:
          }
        },
      ),
    );
  }

  Widget buildMoreRequire(String require) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(require, style: TextStyle(fontStyle: FontStyle.italic)),
    );
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
