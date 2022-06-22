import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/navigation_bar.dart';
import 'package:rescue2/screens/user_login/flutter_toast.dart';

class Attraction extends StatefulWidget {
  const Attraction({Key? key}) : super(key: key);

  @override
  _AttractionState createState() => _AttractionState();
}

class _AttractionState extends State<Attraction> {
  String _value = "1";
  String _value2 = "1";

  String dropdownvalue = 'Change Battery';
  String dropdownitemsvalue = 'KIA';
  List dataList = [];
  var services = [
    'Change Battery',
    'Tow',
    'Quick Service',
  ];
  var carModel = [
    "KIA",
    "Nissan",
    "Toyota",
    "BMW",
    "Mercedes",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          color: Mycolor.white,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Mycolor.darkblue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            title: const Text(
              "services",
              style: TextStyle(fontSize: 25),
            ),
            centerTitle: true,
            leading:
                //This is the arrow icon
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
            color: Mycolor.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Image(
                  image: AssetImage('assets/images/attraction.png'),
                  height: 150,
                ),
                const Text(
                  "What are your services on the road?",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Kind Of Car",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Mycolor.darkblue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: DropdownButton(
                      dropdownColor: Mycolor.Beige,
                      value: dropdownitemsvalue,
                      items: carModel.map((String items) {
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
                      hint: const Text("Select item")),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Services",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Mycolor.darkblue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: DropdownButton(
                      dropdownColor: Mycolor.Beige,
                      value: dropdownvalue,
                      items: services.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      hint: const Text("Select item")),
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedButton(
                  height: 50,
                  width: 250,
                  text: 'SUBMIT',
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  backgroundColor: const Color(0xff48B5D6),
                  borderRadius: 50,
                  onPress: () {
                    FirebaseFirestore.instance.collection("attraction").add({
                      "location": "Cairo",
                      "user_id": FirebaseAuth.instance.currentUser!.uid,
                      "carModel": dropdownitemsvalue,
                      "services": dropdownvalue,
                    }).whenComplete(() => {
                          showToast2(
                              "car ${dropdownitemsvalue}  services ${dropdownvalue}")
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
