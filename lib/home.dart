import 'package:flutter/material.dart';


import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pocket_birds_poc/find_a_bird.dart';
import 'package:pocket_birds_poc/navigation_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Completer<GoogleMapController> _controller = Completer();

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
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Flexible(
              flex: 2,
              child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);})
          ),
          Container(
              height: 5,
              color: Colors.black
          ),
          Flexible(
              flex: 1,
              child: MyNavPage()




              )

        ]
    );
  }
}
