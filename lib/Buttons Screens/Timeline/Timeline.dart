import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/screens/ButtomSheatHelper.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/Buttons Screens/Main Screen/Main Screen.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
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
                Row(
                  children: [
                    //Padding is used here to adjust the place of the icon below
                    Padding(
                        padding: EdgeInsets.only(right: 40),
//This the icon
                        child: Container(
                            height: 30,
                            width: 30,
                            child:
                            Image.asset("assets/images/timeline (1).png"))),
                    IconButton(
                      icon: Icon(Icons.info_outline_rounded),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ButtomSheatHelper();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            body: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Mycolor.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      child: Text(
                        "Milage :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Modified : 26/2/2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Milage Driven : 60,000 KM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      child: Text(
                        "Brakes :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Modified : 26/2/2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Changed At : 70,000 KM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      child: Text(
                        "Battery :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Modified : 26/2/2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Warranty Expiration Date : 26/2/2023",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      child: Text(
                        "Engine Oil :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Modified : 26/2/2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Changed At : 65,000 KM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      child: Text(
                        "Gear Box :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Modified : 26/2/2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Maintained At : 50,000 KM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      child: Text(
                        "Tires :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Last Modified : 26/2/2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Changed At : 40,000 KM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color: Mycolor.darkblue),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}