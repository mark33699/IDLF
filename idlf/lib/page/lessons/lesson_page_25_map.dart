import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LessonPageMap extends StatefulWidget {
  @override
  _LessonPageMapState createState() => _LessonPageMapState();
}

class _LessonPageMapState extends State<LessonPageMap> {

  Completer<GoogleMapController> _controller = Completer();
  bool enableMyLocation = false;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    print("init");
    print(DateTime.now());

    Future.delayed(Duration(seconds: 2)).then((value) {
      print("delayed");
      print(DateTime.now());
      setState(() {
        enableMyLocation = true;
      });
    });

    /// The `timeStamp` is the number of milliseconds since the beginning of the
    /// scheduler's epoch. Use timeStamp to determine how far to advance animation
    /// timelines so that all the animations in the system are synchronized to a
    /// common time base.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("frame");
      print(DateTime.now());
      print(timeStamp);
//      setState(() {
//        enableMyLocation = true;
//      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: enableMyLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}