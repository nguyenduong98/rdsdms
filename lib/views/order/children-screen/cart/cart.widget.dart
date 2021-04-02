import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rdsdms/views/order/children-screen/cart/products.widget.dart';
import 'package:rdsdms/views/order/children-screen/cart/tutorial.widget.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  createState() => CartState();
}

class CartState extends State<Cart> {
  List<int> listProduct = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Đơn hàng'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [Tutorial(), Products(listProduct: listProduct)],
              ),
            )));
  }
}
