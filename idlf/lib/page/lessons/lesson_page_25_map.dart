import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:location/location.dart';

enum MarkerType {top, bottom, left, right}

class LessonPageMap extends StatefulWidget {
  @override
  _LessonPageMapState createState() => _LessonPageMapState();
}

class _LessonPageMapState extends State<LessonPageMap> {

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();
  bool _enableMyLocation = false;

  Map<MarkerId, Marker> _markerMap = <MarkerId, Marker>{};
  LocationData _currentLocation;

  void _getCurrentLocation() async {
    var location = new Location();
    try {
      _currentLocation = await location.getLocation();
      print(_currentLocation);
    } on Exception {
      _currentLocation = null;
    }

    _addMarker(MarkerType.top);
    _addMarker(MarkerType.bottom);
    _addMarker(MarkerType.left);
    _addMarker(MarkerType.right);
  }

  void _addMarker(MarkerType type) {

    final MarkerId markerId = MarkerId("IDLF_$type");

    final offset = 0.002;
    LatLng latLng;
    String snippet;
    switch (type){
      case MarkerType.top:
        latLng = LatLng(_currentLocation.latitude + 0.001, _currentLocation.longitude);
        snippet = "北～玄武";
        break;
      case MarkerType.bottom:
        latLng = LatLng(_currentLocation.latitude - 0.003, _currentLocation.longitude);
        snippet = "南～朱雀";
        break;
      case MarkerType.left:
        latLng = LatLng(_currentLocation.latitude, _currentLocation.longitude - offset);
        snippet = "左～青龍";
        break;
      case MarkerType.right:
        latLng = LatLng(_currentLocation.latitude, _currentLocation.longitude + offset);
        snippet = "右～白虎";
        break;
    }

    final Marker marker = Marker(
      markerId: markerId,
      infoWindow: InfoWindow(title: "Hello~", snippet: snippet),
      position: latLng,
    );

    if (!mounted) return;

    setState(() {
      _markerMap[markerId] = marker;
    });
  }

  @override
  void initState() {
    super.initState();
    print("init");
    print(DateTime.now());

      Future.delayed(Duration(seconds: 2)).then((value) {
      print("delayed");
      print(DateTime.now());
      setState(() {
        _enableMyLocation = true;
        _getCurrentLocation();
      });
    });
  }

  Future<void> _goToGoogle() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: _enableMyLocation,
        myLocationButtonEnabled: true,
        markers: Set<Marker>.of(_markerMap.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(IcoFontIcons.brandGoogle),
        onPressed: _goToGoogle,
      ),
    );
  }
}