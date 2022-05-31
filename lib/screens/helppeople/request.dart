import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rescue2/screens/helppeople/map_widget.dart';
import 'package:rescue2/screens/helppeople/panel_widget.dart';
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
