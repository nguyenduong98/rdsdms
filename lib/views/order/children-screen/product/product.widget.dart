import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import 'package:rdsdms/views/order/children-screen/cart/cart.widget.dart';

class Product extends StatefulWidget {
  Product({Key key}) : super(key: key);

  @override
  createState() => ProductState();
}

class ProductState extends State<Product> {
  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    3,
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text('Chọn sản phẩm'),
                actions: [
                  Stack(
                    children: [
                      Positioned(
                        child: Card(
                          color: Colors.white.withOpacity(0),
                          elevation: 0,
                          child: Container(
                            height: 20,
                            margin: EdgeInsets.only(left: 35, top: 3),
                            padding: EdgeInsets.only(left: 5, right: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: Text('10',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      Positioned(
                          child: IconButton(
                        icon: Icon(
                          Feather.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Get.to(Cart());
                        },
                      ))
                    ],
                  )
                ],
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
                                    hintText: 'Tìm sản phẩm ...'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Card(
                      elevation: 0,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Khách hàng: ',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                              text: 'CÔNG TY TNHH LÝ PHÁT (CH THU HIỀN) ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextSpan(text: '(200188.test)'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, bottom: 20),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Đại lý giao hàng: ',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                              text: 'TOA ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            TextSpan(text: '(100001)'),
                          ],
                        ),
                      )),
                  Container(
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: buildListProduct()),
                  )
                ],
              ),
            )));
  }

  List<Widget> buildListProduct() {
    return data.map((item) => buildProduct()).toList();
  }

  Widget buildProduct() {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        _showOrderProduct('TOA 7IN1');
      },
      child: Container(
        width: width,
        margin: EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        padding: EdgeInsets.only(
            left: width * 0.05, right: width * 0.05, top: 20, bottom: 20),
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10, right: 30),
                  child: Text('TOA 7IN1',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700))),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red,
                    ),
                    padding: EdgeInsets.all(width < 350
                        ? 0
                        : width < 400
                            ? 1
                            : width < 500
                                ? 2
                                : 3),
                    child: Text('10', style: TextStyle(color: Colors.white)),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 24,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _showOrderProduct(String shopName) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return Container(
                    height: height * 0.8,
                    width: width * 0.95,
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                shopName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                        height < 450
                            ? Container()
                            : Expanded(
                                flex: 1,
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: width,
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
                                                  padding: EdgeInsets.only(
                                                      top: 5, left: 10),
                                                  child: Icon(Icons.search))),
                                          Expanded(
                                            flex: 9,
                                            child: Container(
                                              padding: EdgeInsets.only(top: 15),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    hintText:
                                                        'Tìm Khách hàng ...'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))),
                        Expanded(
                          flex: 7,
                          child: Container(
                              child: ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  children: buildListProductDetail())),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: RaisedButton.icon(
                                                color: Colors.blue,
                                                onPressed: () {
                                                  print('cập nhật');
                                                  Navigator.of(context).pop();
                                                },
                                                icon: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.white,
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                label: Text('Thêm vào giỏ',
                                                    style: TextStyle(
                                                        fontSize: width < 350
                                                            ? 13
                                                            : 16,
                                                        color:
                                                            Colors.white))))),
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: OutlinedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                    width: 2.0,
                                                    color: Colors.blue),
                                              ),
                                              onPressed: () {
                                                print('Đóng');
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(Icons.cancel),
                                              label: Text('Đóng',
                                                  style: TextStyle(
                                                    fontSize:
                                                        width < 350 ? 13 : 16,
                                                  ))),
                                        ))
                                  ],
                                )))
                      ],
                    ),
                  );
                },
              ),
            ));
  }

  List<Widget> buildListProductDetail() {
    return data.map((item) => buildProductDetail()).toList();
  }

  Widget buildProductDetail() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 20, bottom: 15, top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SUPPERSHIELD HIGH SHEEN #Base C / 875ml',
              style: TextStyle(fontWeight: FontWeight.w600)),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            child: Text('(11019070000B32)'),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            height: 40,
            width: width * 0.4,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(height: 1, color: Colors.black, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
