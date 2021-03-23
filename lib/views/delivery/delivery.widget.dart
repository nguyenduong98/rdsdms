import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Delivery extends StatefulWidget {
  Delivery({Key key}) : super(key: key);

  @override
  createState() => DeliveryState();
}

class DeliveryState extends State<Delivery> {
  GoogleMapController _controller;
  LocationData currentLocation;
  bool isLoading = true;

  var location = new Location();

  Future<void> _currentLocation() async {
    try {
      currentLocation = await location.getLocation();
    } on PlatformException catch (e) {
      print(e);
      currentLocation = null;
    }

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

  @override
  void initState() {
    super.initState();
    _currentLocation().then((value) => setState(() {
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: isLoading == true
          ? Container(
              alignment: Alignment.centerLeft,
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              mapType: MapType.hybrid,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(37.423454430260634, -122.08404678671813),
                  zoom: 15),
            ),
    )));
  }
}
