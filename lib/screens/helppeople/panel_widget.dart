import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/helppeople/myhelp.dart';
import '../../pojo/help_user.dart';
import '../user_login/flutter_toast.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;

  const PanelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  String? _value = "1";
  String dropdownitemsvalue = 'Flat tire';
  late var otherController = TextEditingController();

  var services = [
    "Flat tire",
    "Charge Battery",
    "Tow",
    "Fill with gasoline",
  ];

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 36),
          buildAboutText(),
          SizedBox(height: 24),
        ],
      );

  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "What 's your problem",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Mycolor.darkblue),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 10,
                top: 20,
              ),
              child: DropdownButton(
                dropdownColor: Mycolor.Beige,
                value: dropdownitemsvalue,
                items: services.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    dropdownitemsvalue = newValue!;
                  });
                },
                //  hint:Text("Select item"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: otherController,
                    decoration: InputDecoration(
                      hoverColor: Colors.white,
                      hintText: "other",
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                top: 20,
                right: 50,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Mycolor.red,
                        fixedSize: const Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("help users")
                            .add({
                          "user_id": FirebaseAuth.instance.currentUser!.uid,
                          "problem": dropdownitemsvalue,
                          "helpFrom": "",
                          "latitude": "29.961962",
                          "longitude": "29.961962",
                          "status": "pending",
                          "color": "red",
                          "other": otherController.text,
                        }).whenComplete(
                                () => {showToast2("${dropdownitemsvalue}")});
                      },
                      child: const Text(
                        'Request',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Mycolor.red,
                        fixedSize: const Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => HelpFrompeople()));
                      },
                      child: Text(
                        "Requests Status",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      );

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
            onTap: () {},
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
                    ' ${userData.helpFrom} | ${userData.other}',
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
}
