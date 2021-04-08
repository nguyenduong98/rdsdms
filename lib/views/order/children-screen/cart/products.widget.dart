import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/order/children-screen/cart/discount.widget.dart';

class Products extends StatefulWidget {
  final List<int> listProduct;
  Products({@required this.listProduct, Key key}) : super(key: key);

  @override
  createState() => ProductsState();
}

class ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: buildlistProduct()),
          buildSumMoney(),
          Discount(),
          buildInfoOfCustomer(),
        ]));
  }

  List<Widget> buildlistProduct() {
    return widget.listProduct.map((item) => buildProduct(item)).toList();
  }

  Widget buildProduct(int product) {
    double width = MediaQuery.of(context).size.width;
    return Container(
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
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(children: [
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text('Sản phẩm', style: TextStyle(fontSize: 15))),
          ),
          Expanded(
            flex: 6,
            child: Text('SƠN XỊT WIN #00200 / 400ML',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                print('delete');
              },
              icon: Icon(
                Icons.delete,
                size: 20,
                color: Colors.red,
              ),
            ),
          )
        ]),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(children: [
            Expanded(
              flex: 3,
              child: Container(
                  alignment: Alignment.center,
                  child: Text('Số lượng', style: TextStyle(fontSize: 15))),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 35,
                width: width * 0.2,
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
                  style:
                      TextStyle(height: 1, color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(' X 248,000 = 20000000'),
              ),
            )
          ]),
        )
      ]),
    );
  }

  Widget buildSumMoney() {
    return Container(
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
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Container(
              alignment: Alignment.center,
              child: Text('TỔNG',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text('30,000,000',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        ),
      ]),
    );
  }

  Widget buildInfoOfCustomer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 10, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Khách hàng:', style: TextStyle(fontSize: 18)),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 15),
            child: Text('CÔNG TY TNHH LÝ PHÁT (CH THU HIỀN) - 200188.test',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Text('Đại lý xác nhận đơn hàng:', style: TextStyle(fontSize: 18)),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: Text('TOA - 100001',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
