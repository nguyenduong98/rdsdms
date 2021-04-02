import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  Position currentLocation;
  GoogleMapController _controller;

  final Set<Marker> _markers = new Set();

  Future<void> _currentLocation() async {
    currentLocation = await Geolocator.getCurrentPosition();

    final coordinates =
        new Coordinates(currentLocation.latitude, currentLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    setState(() {
      address = '${first.addressLine}';
    });

    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   _controller.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       bearing: 0,
    //       target: LatLng(currentLocation.latitude, currentLocation.longitude),
    //       zoom: 15.0,
    //     ),
    //   ));
    // });
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          icon: BitmapDescriptor.fromAsset('assets/images/boy.png')));
    });

    return _markers;
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
                markers: myMarker(),
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
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 20),
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
                                            left: 20, right: 20, bottom: 1),
                                        child: Text(address,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 17)),
                                      ),
                                      RaisedButton(
                                        color: Colors.blue[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0)),
                                        onPressed: () {
                                          Get.to(Customer());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue[900],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 9,
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text('Tiếp tục',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))))
                                            ],
                                          ),
                                        ),
                                      )
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
