import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Discount extends StatefulWidget {
  Discount({Key key}) : super(key: key);

  @override
  createState() => DiscountState();
}

class DiscountState extends State<Discount> {
  List<int> listDiscountSpecial = [1, 2];
  List<int> listDiscount = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
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
      padding: EdgeInsets.only(left: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.topLeft,
            child: Text('CTKM Đặc biệt:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.greenAccent[400])),
          ),
          Container(
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: buildListSpecialDiscount(listDiscountSpecial)),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            alignment: Alignment.topLeft,
            child: Text('Chọn CTKM theo Quý:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                )),
          ),
          Container(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: buildListDiscount(listDiscount)))
        ],
      ),
    );
  }

  List<Widget> buildListSpecialDiscount(List<int> data) {
    return data
        .map((item) => Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'CTKM Đặc biệt: Mua 1 thanh treo 30 gói selun 1% 5ml ==> Chiết khấu thêm 5% (05/10/2020 - 31/12/2020)',
                style: TextStyle(
                    color: Colors.greenAccent[400],
                    fontWeight: FontWeight.w500),
              ),
            ))
        .toList();
  }

  List<Widget> buildListDiscount(List<int> data) {
    return data.map((item) => buildDiscount(item)).toList();
  }

  Widget buildDiscount(int item) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 15),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            flex: 9,
            child: Text(
                'Mua 4 tuýp Acnes trị mụn bất kỳ ==> Tặng 1 Scar Care cùng loại nha',
                style: TextStyle(fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
