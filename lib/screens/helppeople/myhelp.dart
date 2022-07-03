import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/pojo/help_user.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../navigation_bar.dart';
import 'chat.dart';

class HelpFrompeople extends StatefulWidget {
  const HelpFrompeople({Key? key}) : super(key: key);

//help people
  @override
  State<HelpFrompeople> createState() => _HelpFrompeopleState();
}

class _HelpFrompeopleState extends State<HelpFrompeople> {
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
            "Requests Status",
            style: TextStyle(fontSize: 23),
          ),
          centerTitle: true,
          leading: IconButton(
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
          child: Column(children: <Widget>[
            const SizedBox(height: 40),
            Column(
              children: [
                Image.asset(
                  "assets/images/help.png",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 40),
                const Text(
                  "your order",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
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

  Stream<List<HelpUsers>> readUsers() => FirebaseFirestore.instance
      .collection("help users")
      .where("user_id", isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
      .snapshots()
      .map((event) =>
          event.docs.map((e) => HelpUsers.fromJson(e.data())).toList());

  Widget buildUsers(HelpUsers userData) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Mycolor.green,
          ),
          child: InkWell(
            onTap: () {
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(userData.helpFrom)
                  .get()
                  .then((value) => {
                        _showMyDialog(
                            context,
                            "${value.get("number")}",
                            "${value.get("name")} ",
                            " ${value.get("car_model")} "),
                      });
            },
            child: Column(
              children: [
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
                    ' ${userData.status} | ${userData.other}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> _showMyDialog(
      BuildContext context, String phone, String name, String carModel) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
              alignment: Alignment.topRight,
              child: Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              )),
          content: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      "   name : ${name}  ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "   phone : ${phone}  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "   car model : ${carModel}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          )),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _launchURL("tel:${phone}");
                },
                icon: Icon(
                  Icons.phone,
                  color: Mycolor.red,
                  size: 30,
                )),
            SizedBox(
              width: 5,
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ChatScreen()));
                },
                icon: Icon(Icons.chat, color: Mycolor.red, size: 30)),
          ],
        );
      },
    );
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
