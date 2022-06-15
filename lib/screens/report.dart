import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:rescue2/pojo/trafc.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/navigation_bar.dart';
import 'package:rescue2/screens/user_login/flutter_toast.dart';

import '../pojo/help_user.dart';
import 'helppeople/InvitationScreen.dart';
import 'helppeople/request.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {

  late var _locationCon = TextEditingController();
  late var causesCon = TextEditingController();
  late String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid)
    .get().then((value) => {
      name = value.get("name")
    });
  }
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
                const SizedBox(height: 50),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/help.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                            controller: _locationCon,
                            decoration: InputDecoration(
                                labelText: "Location",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Mycolor.darkblue,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black12,
                                filled: true,
                                border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(10)),
                            hintText:
                            'region,main street name,branch street name',
                            suffixIcon: Icon(Icons.send)
                        ),
                      ),
                    TextFormField(
                      controller: causesCon,
                      decoration: InputDecoration(
                          labelText: "Causes",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Mycolor.darkblue,
                              fontWeight: FontWeight.bold),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(10)),
                          hintText:
                          'Causes',
                          suffixIcon: Icon(Icons.send)
                      ),
                    ),
                     ],
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    onPressed: () {
                      if (_locationCon.text.isEmpty) {
                        showToast2("Please enter your location");
                      } else if (causesCon.text.isEmpty) {
                        showToast2("Please enter your causes");
                      } else {
                        FirebaseFirestore.instance.collection('traffic').add({
                          'location': _locationCon.text,
                          'causes': causesCon.text,
                          'uuid': '${name}',
                        }).whenComplete(() =>
                        {
                          showToast2("Report sent successfully"),
                        });
                      }
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),

                SizedBox(height: 5,),

                Expanded(
                  child: StreamBuilder<List<Traffic>>(
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


  Stream<List<Traffic>> readUsers() =>
      FirebaseFirestore.instance
          .collection("traffic")
          .snapshots().map(
              (event) => event.docs.map((e) => Traffic.fromJson(e.data())).toList());

  Widget buildUsers(Traffic userData) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child:Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Mycolor.green,
      ),
      child: InkWell(
        onTap: (){

        },
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '${userData.uuid}',
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
              ' ${userData.causes} | ${userData.location}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

          ),
        ],),
      ),
    ),

    /* Item(context,  location: userData.location, phone: userData.problem, status: userData.status, name: userData.color, uuid: userData.user_id),
 */ );

//
  /*
  * SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 5),
                    Image.asset(
                      "assets/images/traffic.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _locationCon,
                      decoration: InputDecoration(
                          labelText: "Location",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Mycolor.darkblue,
                              fontWeight: FontWeight.bold),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText:
                              'region,main street name,branch street name',
                          suffixIcon: Icon(Icons.send)
               ),
             ),
             SizedBox(height: 5),
                TextFormField(
                  controller: causesCon,
                      decoration: InputDecoration(
                          labelText: "What causes traffic congestion",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Mycolor.darkblue,
                              fontWeight: FontWeight.bold),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText:'ex accident',
                   suffixIcon: Icon(Icons.send)
          ),
          ),
          SizedBox(height: 5),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Mycolor.red,
                          fixedSize: const Size(250, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {
                          if (_locationCon.text.isEmpty) {
                            showToast2("Please enter your location");
                          }else if(causesCon.text.isEmpty){
                            showToast2("Please enter your causes");
                          }else{
                            FirebaseFirestore.instance.collection('traffic').add({
                              'location': _locationCon.text,
                              'causes': causesCon.text,
                              'uuid': '${FirebaseAuth.instance.currentUser!.uid}',
                            }).whenComplete(() => {
                              showToast2("Report sent successfully"),
                            });


                          }



                        },
                        child: const Text(
                          'Report',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),

                    Expanded(
                      child: StreamBuilder<List<Traffic>>(
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


           ],
         ),
       ),*/

  /*StreamBuilder<List<Traffic>>(
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
                  ),*/
  /*
  Stream<List<Traffic>> readUsers() =>
      FirebaseFirestore.instance
          .collection("traffic")
          .snapshots().map(
              (event) => event.docs.map((e) => Traffic.fromJson(e.data())).toList());

  Widget buildUsers(Traffic userData) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child:Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Mycolor.green,
      ),
      child: InkWell(
        onTap: (){

        },
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '${userData.uuid}',
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
              ' ${userData.causes} | ${userData.location}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

          ),



        ],),
      ),
    ));
*/

}

