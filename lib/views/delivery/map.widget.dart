import 'dart:core';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'package:rdsdms/views/delivery/children-screen/customer/customer.widget.dart';

class MapWidget extends StatefulWidget {
  final bool showAddress;

  MapWidget({@required this.showAddress, Key key}) : super(key: key);

  @override
  createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  bool isLoading = true;
  String address = '';
  LocationData currentLocation;
  GoogleMapController _controller;
  List<String> listAvatar = [
    'https://dulichvietnam.com.vn/vnt_upload/news/02_2020/doi_hoa_oai_huong_sapa_10.jpg',
    'https://nld.mediacdn.vn/thumb_w/540/2020/5/29/doi-hoa-tim-8-15907313395592061395682.png',
    'https://dulichkhampha24.com/wp-content/uploads/2020/04/dia-diem-song-ao-o-ha-noi-5.jpg'
  ];
  List<LatLng> addred = [
    LatLng(10.794741608549263, 106.65744448632397),
    LatLng(10.795816582906017, 106.65049220019674),
    LatLng(10.790947550673332, 106.65077114994875)
  ];

  final Set<Marker> _markers = new Set();
  var location = new Location();

  Future<void> _currentLocation() async {
    try {
      currentLocation = await location.getLocation();
    } on PlatformException catch (e) {
      print(e);
      currentLocation = null;
    }

    final coordinates =
        new Coordinates(currentLocation.latitude, currentLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    setState(() {
      address = '${first.addressLine}';
    });

    location.onLocationChanged.listen((LocationData currentLocation) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 15.0,
        ),
      ));
    });
  }

  Future<Set<Marker>> convertImageFileToBitmapDescriptor(
      {int size = 150,
      bool addBorder = true,
      Color borderColor = Colors.red,
      double borderSize = 10,
      String title,
      Color titleColor = Colors.white,
      Color titleBackgroundColor = Colors.black}) async {
    for (var i = 0; i <= listAvatar.length; i++) {
      final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(pictureRecorder);
      final Paint paint = Paint()..color;
      final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
      );
      final double radius = size / 2;

      final Path clipPath = Path();
      clipPath.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
          Radius.circular(100)));
      canvas.clipPath(clipPath);

      final avatar = await http.get(listAvatar[i]);
      ui.Codec codec = await ui.instantiateImageCodec(avatar.bodyBytes,
          targetWidth: 180, targetHeight: 180);
      ui.FrameInfo fi = await codec.getNextFrame();
      paintImage(
          canvas: canvas,
          rect: Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
          image: fi.image);

      if (addBorder) {
        paint..color = borderColor;
        paint..style = PaintingStyle.stroke;
        paint..strokeWidth = borderSize;
        canvas.drawCircle(Offset(radius, radius), radius, paint);
      }

      if (title != null) {
        if (title.length > 9) {
          title = title.substring(0, 9);
        }

        paint..color = titleBackgroundColor;
        paint..style = PaintingStyle.fill;
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromLTWH(0, size * 8 / 10, size.toDouble(), size * 3 / 10),
                Radius.circular(100)),
            paint);

        textPainter.text = TextSpan(
            text: title,
            style: TextStyle(
              fontSize: radius / 2.5,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ));
        textPainter.layout();
        textPainter.paint(
            canvas,
            Offset(radius - textPainter.width / 2,
                size * 9.5 / 10 - textPainter.height / 2));
      }

      final _image = await pictureRecorder
          .endRecording()
          .toImage(size, (size * 1.1).toInt());
      final data = await _image.toByteData(format: ui.ImageByteFormat.png);

      final coordinates =
          new Coordinates(addred[i].latitude, addred[i].longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId(i.toString()),
            position: addred[i],
            infoWindow: InfoWindow(
                title: 'Cửa hàng Thịnh Vượng',
                snippet: addresses.first.addressLine),
            icon: BitmapDescriptor.fromBytes(data.buffer.asUint8List())));
      });
    }
    return _markers;
  }

  Set<Marker> buildMarkerofStaff() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(listAvatar.length.toString()),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          icon: BitmapDescriptor.fromAsset('assets/images/boy.png')));
    });

    return _markers;
  }

  @override
  void initState() {
    super.initState();
    _currentLocation().then((value) => setState(() {
          convertImageFileToBitmapDescriptor();
          buildMarkerofStaff();
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return isLoading == true
        ? Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              Positioned(
                  child: GoogleMap(
                markers: _markers,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        currentLocation.latitude, currentLocation.longitude),
                    zoom: 15),
              )),
              widget.showAddress == true
                  ? Positioned(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: height < 600 ? 7 : 8, child: Container()),
                            Expanded(
                                flex: height < 600 ? 3 : 2,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.only(right: 10, left: 10),
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: Text(address,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 17)),
                                      ),
                                      Container(
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.blue),
                                          margin: EdgeInsets.only(
                                              bottom: height < 400 ? 5 : 20),
                                          height: 45,
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(Customer());
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    height: 35,
                                                    width: 35,
                                                    child:
                                                        Icon(AntDesign.check)),
                                                Expanded(
                                                  flex: 9,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text('Tiếp tục',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  : Container()
            ],
          );
  }
}
