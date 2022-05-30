import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/helppeople/getlocation_service.dart';
import 'package:rescue2/screens/helppeople/request.dart';
import 'package:rescue2/pojo/user_data.dart';
import 'package:rescue2/screens/winchpage/item.dart';


import '../navigation_bar.dart';

class Helppeople extends StatefulWidget {
  const Helppeople({Key? key}) : super(key: key);
//help people
  @override
  State<Helppeople> createState() => _HelppeopleState();
}

class _HelppeopleState extends State<Helppeople> {
  //FirebaseService _service = FireBaseService();
  double _latitude = 0;
  double _longitude = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Mycolor.darkblue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),

          title: const Text(
            "Help From People",
            style: TextStyle(fontSize: 23),
          ),
          centerTitle: true,

          leading:
          IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const Home();
                    }));
              }),
        ),

        body: Container(
          alignment: Alignment.center,
          color: Mycolor.white,
          child: Column(
              children: <Widget>[
                const SizedBox(height: 40),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/help.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 40),
                    const Text("Ask for help from people around you",
                      style: TextStyle(fontSize: 18,color:Colors.black ),),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    onPressed: () {
                      /* LocationService _locationService = LocationService();
                          _locationService.sendLocationToDataBase(context); */
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return  Request();
                          }));
                    },
                    child: const Text(
                      'Request',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),


              ]),
        ),
      ),
    );

  }


  Stream<List<UserData>> readWinshs() =>
      FirebaseFirestore.instance
          .collection("help users")
          .where("user_id", isNotEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
          .snapshots().map(
              (event) => event.docs.map((e) => UserData.fromJson(e.data())).toList());

  Widget buildWinshs(UserData userData) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Item(context,  location: userData.status, phone: userData.name, status: userData.status, name: userData.name, uuid: userData.uId),
  );

}

