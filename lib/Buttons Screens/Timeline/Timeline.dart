import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/pojo/timline.dart';
import 'package:rescue2/screens/ButtomSheatHelper.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/Buttons Screens/Main Screen/Main Screen.dart';

import '../../screens/user_login/flutter_toast.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  var a;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //The title of the app
      title: 'Rescue',
      //Statement to remove the demo banner from the application
      debugShowCheckedModeBanner: false,
      //This is the declaration of the home screen
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Tiimeline.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Mycolor.white,
            appBar: AppBar(
//This is the color of the app bar's BackGround
              backgroundColor: Mycolor.darkblue,
              //This is to control the shape of the appbar borders
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              //This is the title that will appear in the app bar
              title: Text(
                ("Timeline"),
                //This is the stye of the text which is whether it is bold or not and the spacing between the letters and the font color
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    color: Colors.white),
              ),
//This is a statement to put the title in the middle of the app bar
              centerTitle: true,
//Leading is used to put the items on the left side on the app bar but in this case the icon
              leading:
              //This is the arrow icon
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return Main_Screen();
                        }));
                  }),
//Action is used to put the items on the right side on the app bar but in this case the icon

              actions: [

                    Padding(
                        padding: EdgeInsets.only(right: 80),
//This the icon
                        child: Container(
                            height: 30,
                            width: 30,
                            child:
                            Image.asset("assets/images/timeline (1).png"))),
              ],
            ),
            body: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Mycolor.white,
                child: Column(
                  children: [

                    Expanded(
                      child: StreamBuilder<List<timeline>>(
                        stream: readTimline("Milage"),
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
                                children: users.map(buildTimeLine).toList(),
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
                    Expanded(
                      child: StreamBuilder<List<timeline>>(
                        stream: readTimline("Engine Oil"),
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
                                children: users.map(buildTimeLine).toList(),
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
                    Expanded(
                      child: StreamBuilder<List<timeline>>(
                        stream: readTimline("Gear Box"),
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
                                children: users.map(buildTimeLine).toList(),
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
                    Expanded(
                      child: StreamBuilder<List<timeline>>(
                        stream: readTimline("Tires"),
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
                                children: users.map(buildTimeLine).toList(),
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
                    Expanded(
                      child: StreamBuilder<List<timeline>>(
                        stream: readTimline("Brakes"),
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
                                children: users.map(buildTimeLine).toList(),
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
                    Expanded(
                      child: StreamBuilder<List<timeline>>(
                        stream: readTimline("Battery"),
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
                                children: users.map(buildTimeLine).toList(),
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
              ),
            ),
        )),
    );
  }

  Stream<List<timeline>> readTimline(String type) =>
      FirebaseFirestore.instance.collection("Maintenance").doc(FirebaseAuth.instance.currentUser!.uid).collection(type).snapshots().map(
              (event) => event.docs.map((e) => timeline.fromJson(e.data())).toList());



  Widget buildTimeLine(timeline t) =>  Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: 80,
      width: 350,
      decoration: BoxDecoration(
          color: Mycolor.red),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(children: [
            Text(
              "${t.name}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${t.Date}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                //   fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "${t.Content}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                //     fontWeight: FontWeight.bold
              ),
            ),
          ]),
        ),
      )
    ),
  );

}