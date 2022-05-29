import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/navigation_bar.dart';
import 'package:rescue2/screens/user_login/flutter_toast.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {

  late var _locationCon = TextEditingController();
  late var causesCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
      decoration: BoxDecoration(
      color: Mycolor.white,
    ),
    child: Scaffold(
    appBar:AppBar(
    backgroundColor: Mycolor.darkblue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(30),
    bottomLeft: Radius.circular(30))),

    // actions: const [ Icon(Icons.chat_outlined )],
    title: const Text(
    "Report For Traffic",
    style: TextStyle(fontSize: 25),
    ),
    centerTitle: true,
    leading:
    //This is the arrow icon
    IconButton(
    icon: Icon(Icons.arrow_back_ios),
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (BuildContext context) {
    return Home();
    }));
    }),
    ),

      body:Padding(
        padding:const EdgeInsets.all(11.0),
        child:Form(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Image.asset(
                      "assets/images/traffic.png",
                      width: 170,
                      height: 170,
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: _locationCon,
                      decoration: InputDecoration(
                          labelText: "Location",
                          labelStyle: TextStyle(
                              fontSize: 25,
                              color: Mycolor.darkblue,
                              fontWeight: FontWeight.bold),
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText:
                              'region,main street name,branch street name',
                          suffixIcon: Icon(Icons.send)
               ),
             ),
             SizedBox(height: 30),
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText:'ex accident',
                   suffixIcon: Icon(Icons.send)
          ),
          ),
          SizedBox(height: 30),
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
           ],
         ),
       ),
    ),
    ),
    ),
      ),
    );
  }
}

