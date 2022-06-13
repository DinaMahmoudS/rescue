import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/user_signup/signup2.dart';

import '../SplashScreen.dart';
import '../user_signup/signup.dart';


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);


  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late String name ="" , number ="" ,emgNumber ="", carModel ="" , carColor ="",license ="", password ="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection("users")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .get().then((value) => {
      name = value.get("name"),
      number = value.get("number"),
      emgNumber = value.get("em_number"),
      carModel = value.get("car_model"),
      carColor = value.get("car_color"),
      license = value.get("email"),


    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
// this is scaffold test
        appBar: AppBar(
          backgroundColor: Mycolor.darkblue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),

          // leading: const Icon(Icons.menu_open_rounded, color: Colors.red, ),

          // actions: const [ Icon(Icons.chat_outlined )],
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),


        body: Container(
          alignment: Alignment.center,
          color: Mycolor.white,

          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),

              child: Column(
                children: <Widget>[

                  Container(
                    child:
                    //InputField(),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Mycolor.teal,
                              ),
                              Text(name,style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.call_rounded,
                                color: Mycolor.teal,
                              ),
                             Text(number , style: TextStyle(color: Colors.black),)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.call_rounded,
                                color: Mycolor.teal,
                              ),

                              Text(emgNumber,style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.directions_car_rounded,
                              ),

                              Text(carModel,style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.directions_car_rounded,
                                color: Mycolor.teal,
                              ),

                              Text(carColor,style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: Row(
                            children: [

                              Icon(
                                Icons.topic_outlined,
                                color: Mycolor.teal,
                              ),

                              Text(license,style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ),
                       /* Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Mycolor.teal,
                                ),
                                border: InputBorder.none
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Retype-Password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Mycolor.teal,
                                ),
                                border: InputBorder.none
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),




                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Mycolor.red,
                            fixedSize: const Size(300, 43),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          onPressed: () {

                            FirebaseAuth.instance.signOut();

                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return SplashScreen();
                                }));
                          },
                          child: const Text(''
                              'log out',
                              style: TextStyle(
                                fontSize: 18,
                              ))),
                    ],
                  ),
                  const SizedBox(height: 70),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
