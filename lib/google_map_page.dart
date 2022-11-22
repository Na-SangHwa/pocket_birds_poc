import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyGoogleMapPage extends StatefulWidget {
  const MyGoogleMapPage({Key? key}) : super(key: key);

  @override
  State<MyGoogleMapPage> createState() => _MyGoogleMapPageState();
}

class LocationData {
  late final double latitude; // Latitude, in degrees
  late final double longitude; // Longitude, in degrees
}

class _MyGoogleMapPageState extends State<MyGoogleMapPage> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(36.5607, 128.7304),
    zoom: 14.4746,
  );

  @override
  void _currentLocation() async {


    final GoogleMapController controller = await _controller.future;
    LocationData? currentLocation;
    var location = new Location();
    try {
      currentLocation = (await location.getLocation()) as LocationData;
    } on Exception {
      currentLocation = null;
    }
//check this out on stack overflow -Unhandled Exception: Null check operator used on a null value
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation!.latitude, currentLocation.longitude),
        zoom: 14.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialCamera,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);},

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _currentLocation,
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),

      ),

    );
  }
}
