import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:rdsdms/constant/delivery.constant.dart';

import 'package:rdsdms/views/shares/list-checkbox.widget.dart';

class ImageCustomer extends StatefulWidget {
  ImageCustomer({Key key}) : super(key: key);

  @override
  createState() => ImageCustomerState();
}

class ImageCustomerState extends State<ImageCustomer> {
  File boardImage;
  File productImage;
  File machineImage;

  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8];

  Future<void> _getImage(int typeImage) async {
    File _image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (typeImage == DeliveryConstant.boardImage) {
        boardImage = _image;
      } else if (typeImage == DeliveryConstant.productImage) {
        productImage = _image;
      } else {
        machineImage = _image;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBoardImage(),
        buildProductImage(),
        buildMachineImage(),
      ],
    );
  }

  Widget buildImage(String title, File imageFile, int typeImage) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            width: width * 0.9,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: 30),
            child: InkWell(
              onTap: () {
                _getImage(typeImage);
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: Icon(Icons.camera, color: Colors.blue),
                  ),
                  Expanded(
                      flex: 8,
                      child: Text(title,
                          style: TextStyle(fontSize: 20, color: Colors.white)))
                ],
              ),
            )),
        imageFile == null
            ? Container()
            : Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(imageFile, fit: BoxFit.contain),
                ),
              )
      ],
    );
  }

  Widget buildBoardImage() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        buildImage('Hình cửa hàng / bảng hiệu', boardImage,
            DeliveryConstant.boardImage),
        Container(
          width: width * 0.9,
          child: ListCheckbox(data: data),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text('Ghi chú:', style: TextStyle(fontSize: 17)),
        ),
        Container(
          margin:
              EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              contentPadding: EdgeInsets.all(8),
              hintText: 'Ghi chú cửa hàng / bảng hiệu',
            ),
          ),
        )
      ],
    );
  }

  Widget buildProductImage() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        buildImage('Hình trưng bày sản phẩm', productImage,
            DeliveryConstant.productImage),
        Container(width: width * 0.9, child: ListCheckbox(data: data)),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text('Ghi chú:', style: TextStyle(fontSize: 17)),
        ),
        Container(
          margin:
              EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              contentPadding: EdgeInsets.all(8),
              hintText: 'Ghi chú hình trưng bài sản phẩm',
            ),
          ),
        )
      ],
    );
  }

  Widget buildMachineImage() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        buildImage('Hình máy pha màu / khác', machineImage,
            DeliveryConstant.machineImage),
        Container(
          width: width * 0.9,
          child: ListCheckbox(data: data),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text('Ghi chú:', style: TextStyle(fontSize: 17)),
        ),
        Container(
          margin: EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, top: 5, bottom: 20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              contentPadding: EdgeInsets.all(8),
              hintText: 'Ghi chú hình máy pha màu / khác',
            ),
          ),
        )
      ],
    );
  }
}
