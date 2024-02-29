import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  final LocationData myLocation;
  const MapView({super.key, required this.myLocation});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _myController =
      Completer<GoogleMapController>();

  late CameraPosition _kGooglePlex;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // Set<Marker> markers = <Marker>{};

  List<Marker> markers = [];

  int index = 0;

  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.myLocation.latitude ?? 0.0,
          widget.myLocation.longitude ?? 0.0),
      zoom: 30,
    );

    markers.add(Marker(
      icon: BitmapDescriptor.defaultMarker,
      markerId: MarkerId('omar'),
      position: LatLng(widget.myLocation.latitude ?? 0.0,
          widget.myLocation.longitude ?? 0.0),
    ));

    super.initState();
  }

  LatLng selectedLocation = LatLng(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onTap: (position) {
          markers.add(Marker(
            icon: BitmapDescriptor.defaultMarker,
            markerId: MarkerId('omar'),
            position: position,
          ));
          selectedLocation = position;
          setState(() {});
        },
        markers: markers.toSet(),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _myController.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _myController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
