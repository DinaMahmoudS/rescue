import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/Buttons%20Screens/Main%20Screen/Main%20Screen.dart';
import 'package:rescue2/screens/colors.dart';


class Brakes extends StatefulWidget {
  const Brakes({Key? key}) : super(key: key);

  @override
  _BrakesState createState() => _BrakesState();
}

class _BrakesState extends State<Brakes> {
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
            image: AssetImage("assets/images/Brakes.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Mycolor.white,
          appBar: AppBar(
//This is the color of the app bar's BackGround
            backgroundColor:Mycolor.darkblue,
            //This is to control the shape of the appbar borders
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            //This is the title that will appear in the app bar
            title: Text(
              ("Brakes"),
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
//Padding is used here to adjust the place of the icon below
              Padding(
                  padding: EdgeInsets.only(right: 80),
//This the Maintenance icon
                  child: Container(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/images/brake-disc.png"))),
            ],
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Container(
                    height: 70,
                    child: const TextField(
                      decoration: InputDecoration(
                        hoverColor: Colors.white,
                        hintText: "Milage You Changed your brake calipers at",
                        icon: Icon(
                          Icons.speed_rounded,
                          color: Colors.blue,
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    height: 70,
                    child: const TextField(
                      decoration: InputDecoration(
                        hoverColor: Colors.white,
                        hintText: "Enter the current milage",
                        icon: Icon(
                          Icons.speed_rounded,
                          color: Colors.blue,
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Mycolor.red,
                          fixedSize: Size(300, 70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Main_Screen();
                        }));
                      },
                      child: Text("Done")),
                ),
              ]),
        ),
      ),
    );
  }
}
