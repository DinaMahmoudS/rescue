import 'package:flutter/material.dart';
import 'package:rescue2/directions_model.dart';
import 'package:rescue2/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  @override
  void initState() {
    getLoc();
    super.initState();
  }

  LocationData? loc;
  Future<void> getLoc() async
  {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    loc = _locationData;
    print(_locationData);
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  Marker ? _origin;
  late Marker _destination;
  late Directions _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Google Maps'),
        actions: [
          // if (_origin != null)
          TextButton(
            onPressed: () {
              _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(
                        loc!.latitude!,
                        loc!.longitude!
                    ),
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              );
              setState((){
                _origin = Marker(
                    markerId: const MarkerId('origin'),
                    infoWindow: const InfoWindow(title: 'Origin'),
                    icon:
                    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                    position: LatLng(loc!.latitude!,loc!.longitude!));
              });
            },
            style: TextButton.styleFrom(
              primary: Colors.green,
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
            ),
            child: const Text('ORIGIN'),
          ),
          // if (_destination != null)
          //   TextButton(
          //     onPressed: () => _googleMapController.animateCamera(
          //       CameraUpdate.newCameraPosition(
          //         CameraPosition(
          //           target: _destination.position,
          //           zoom: 14.5,
          //           tilt: 50.0,
          //         ),
          //       ),
          //     ),
          //     style: TextButton.styleFrom(
          //       primary: Colors.blue,
          //       textStyle: const TextStyle(fontWeight: FontWeight.w600),
          //     ),
          //     child: const Text('DEST'),
          //   )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin!,
              // if (_destination != null) _destination
            },
            // polylines: {
            //   if (_info != null)
            //     Polyline(
            //       polylineId: const PolylineId('overview_polyline'),
            //       color: Colors.red,
            //       width: 5,
            //       points: _info.polylinePoints
            //           .map((e) => LatLng(e.latitude, e.longitude))
            //           .toList(),
            //     ),
            // },
            onLongPress: _addMarker,
          ),
          // if (_info != null)
          //   Positioned(
          //     top: 20.0,
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 6.0,
          //         horizontal: 12.0,
          //       ),
          //       decoration: BoxDecoration(
          //         color: Colors.yellowAccent,
          //         borderRadius: BorderRadius.circular(20.0),
          //         boxShadow: const [
          //           BoxShadow(
          //             color: Colors.black26,
          //             offset: Offset(0, 2),
          //             blurRadius: 6.0,
          //           )
          //         ],
          //       ),
          //       child: Text(
          //         '${_info.totalDistance}, ${_info.totalDuration}',
          //         style: const TextStyle(
          //           fontSize: 18.0,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: LatLng(38.9647,35.2233),
        );
        // Reset destination
        final _destination = null;

        // Reset info
        final _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      // final directions = await DirectionsRepository()
      //     .getDirections(origin: _origin.position, destination: pos);
      // setState(() => _info = Directions as Directions);
    }
  }
}
