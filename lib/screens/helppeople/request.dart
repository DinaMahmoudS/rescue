import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rescue2/screens/helppeople/map_widget.dart';
import 'package:rescue2/screens/helppeople/panel_widget.dart';
import 'dart:async';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.007413, 31.4913182),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(30.007413, 31.4913182),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

          body: SlidingUpPanel(
           body: MapWidget(),
      panelBuilder: (controller) => PanelWidget(
        controller: controller,

        
      ),
          ),
    );
  }

  }
