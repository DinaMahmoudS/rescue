import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:rescue2/pojo/Map.dart';
import 'package:url_launcher/url_launcher.dart';

class InvitationScreen extends StatefulWidget {
  String uuid;

  InvitationScreen({Key? key, required this.uuid}) : super(key: key);

  @override
  _InvitationScreenState createState() => _InvitationScreenState();}

class _InvitationScreenState extends State<InvitationScreen> {
  final loc.Location location = loc.Location();
  Completer<GoogleMapController> _controller = Completer();
  late String name = "",phone ="", car="";


  @override
  void initState() {
    super.initState();
    //_requestPermission();
    location.changeSettings(
        interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
    _getMyLocation();

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Map',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              //print("getUsersUId "+_authClass.getUsersUId());
              _getMyLocation();
              /* Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => HomeScreen(email: "",)));*/
            },
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.12,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder<Google_Map?>(
          future: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data;
              return user == null
                  ? Center(child: Text("no User"))
                  : buildUser(user);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("error ${snapshot.error}", style: TextStyle(color: Colors.black),),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<Google_Map?> readUser() async {
    final me = FirebaseFirestore.instance.collection("maps").doc("${widget.uuid}");
    final snapshot = await me.get();
    if (snapshot.exists) {
      return Google_Map.fromJson(snapshot.data()!);
    }
  }

  Widget buildUser(Google_Map user) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(user.latitude) ,double.parse(user.longitude)), zoom: 5.0, tilt: 0, bearing: 0),
        onMapCreated:  (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        markers: _createMarker(user.latitude, user.longitude),

        // trafficEnabled: true,
      ),
    );
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

  Set<Marker> _createMarker(String LatLn, Lat) {
  FirebaseFirestore.instance.collection("users").doc(widget.uuid).get().then((value) => {
    name =  value.get("name").toString(),
    phone =  value.get("number").toString(),
    car =  value.get("car_model").toString(),
  });
    return {
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(double.parse(LatLn), double.parse(Lat)),
        infoWindow: InfoWindow(
            title: '${name}',
            onTap: (){
              _launchURL("tel:+${phone}");
            },
            snippet: "phone ${phone} car model ${car}"),
      ),


    };
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

}
