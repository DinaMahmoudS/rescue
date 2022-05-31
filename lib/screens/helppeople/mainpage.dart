import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/pojo/help_user.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/helppeople/getlocation_service.dart';
import 'package:rescue2/screens/helppeople/request.dart';
import 'package:rescue2/pojo/user_data.dart';
import 'package:rescue2/screens/winchpage/item.dart';


import '../navigation_bar.dart';
import '../user_login/flutter_toast.dart';

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

                SizedBox(height: 10,),

                Expanded(
                  child: StreamBuilder<List<HelpUsers>>(
                    stream: readUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final users = snapshot.data!;



                        if (users.contains("false")) {
                          return Text(
                            "no friends for you",
                            style: TextStyle(color: Colors.black),
                          );
                        } else {
                          // return Text("no friends you" , style: TextStyle(color: Colors.white),);
                          return ListView(
                            children: users.map(buildUsers).toList(),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return Text(
                          "hasError ${snapshot.error}",
                          style: TextStyle(color: Colors.black),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),

              ]),
        ),
      ),
    );

  }


  Stream<List<HelpUsers>> readUsers() =>
      FirebaseFirestore.instance
          .collection("help users")
          .where("user_id", isNotEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
          .snapshots().map(
              (event) => event.docs.map((e) => HelpUsers.fromJson(e.data())).toList());

  Widget buildUsers(HelpUsers userData) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child:Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Mycolor.green,
      ),
      child: InkWell(
        onTap: (){
          showToast2("${userData.user_id}");
        },
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '${userData.problem}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              ' ${userData.latitude} | ${userData.longitude}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              ' ${userData.helpFrom} | ${userData.other}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  showToast2("accepted");


                },
              ),
              SizedBox(
                width: 10,
              ),

              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {

                  })


                // FirebaseFirestore.instance.collection("help users").doc().delete();





            ],
          ),
        ],),
      ),
    ),

    /* Item(context,  location: userData.location, phone: userData.problem, status: userData.status, name: userData.color, uuid: userData.user_id),
 */ );

}

