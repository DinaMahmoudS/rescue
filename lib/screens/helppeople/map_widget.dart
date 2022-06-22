import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart' as loc;

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

// map
  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  final loc.Location location = loc.Location();
  late loc.LocationData _locationResult;

  late double originLatitude = 29.961962, originLongitude = 29.961962;

  _getLocation() async {
    try {
      _locationResult = await location.getLocation();
      originLatitude = _locationResult.latitude!;
      originLongitude = _locationResult.longitude!;
    } on Exception {
      print('Could not get location');
    }
  }

  _getMyLocation() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('maps').doc(id).set({
        'latitude': "${_locationResult.latitude}",
        'longitude': "${_locationResult.longitude}",
        'id': '${id}'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
    _getLocation();
    _getMyLocation();
  }

  Set<Marker> _createMarker(double LatLn, Lat) {
    return {
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(Lat, LatLn),
        infoWindow: InfoWindow(
            title: 'me', snippet: "${LatLn} LatLn + LatLn  ${LatLn}"),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(originLatitude, originLongitude),
          zoom: 5.0,
          tilt: 0,
          bearing: 0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
