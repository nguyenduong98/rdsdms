import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  Rating({Key key}) : super(key: key);

  @override
  createState() => RatingState();
}

class RatingState extends State<Rating> {
  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // List<int> data

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            width: width,
            height: height * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: width < 700 ? Colors.grey : Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0.0, 0.0),
                        //     blurRadius: 6.0,
                        //   ),
                        // ],
                      ),
                      margin: EdgeInsets.only(left: 20),
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://dotobjyajpegd.cloudfront.net/photo/5d6503b3df04120cc4c6353d_m')),
                    )),
                Expanded(
                    flex: 7,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cửa hàng Thịnh Vượng',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                          Text(
                              'Vị trí: 157 Xuân Hồng, phường 12, quận Tân Bình, Tp. Hồ Chí Minh',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.green[700]))
                        ],
                      ),
                    ))
              ],
            )),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: buildListRating(data)),
        )
      ],
    );
  }

  List<Widget> buildListRating(List<int> data) {
    return data.map((item) => buildRating(item)).toList();
  }

  Widget buildRating(int item) {
    return Card(
        elevation: 3,
        child: ExpandablePanel(
          header: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Text(
                  "Rating $item",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              )),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: buildListItemRating(data))
            ],
          ),
          builder: (_, collapsed, expanded) {
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Expandable(
                collapsed: collapsed,
                expanded: expanded,
                theme: const ExpandableThemeData(crossFadePoint: 0),
              ),
            );
          },
        ));
  }

  List<Widget> buildListItemRating(List<int> dataItem) {
    return dataItem.map((item) => buildItemRating(item)).toList();
  }

  Widget buildItemRating(int item) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin:
          EdgeInsets.only(left: width * 0.01, right: width * 0.05, bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 6.0,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.3),
      ),
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nơi trưng bày:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
          RatingBar.builder(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }
}
