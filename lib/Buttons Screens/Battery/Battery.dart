import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/Buttons%20Screens/Main%20Screen/Main%20Screen.dart';
import 'package:rescue2/screens/colors.dart';


class Battery extends StatefulWidget {
  const Battery({Key? key}) : super(key: key);

  @override
  _BatteryState createState() => _BatteryState();
}

class _BatteryState extends State<Battery> {
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
             image: AssetImage("assets/images/Maintenance.jpg"),
             fit: BoxFit.cover,
           ),
         ),
        child:
      Scaffold(
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
              ("Battery"),
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
//This the Maintenance icon put as an image but viewed as an icon in the application and put inside a container to resize it as i desire
                  child: Container(
                      //This is to set the height of the container that contains the photo
                      height: 30,
                      //This is to set the width of the container that contains the photo
                      width: 30,
                      //This the image to be viewd as icon in the application
                      child: Image.asset("assets/images/car-battery.png"))),
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
                        hintText:
                            "Enter the date You put the battery in the car",
                        icon: Icon(
                          Icons.calendar_today_outlined,
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
                        hintText: "Enter the warranty expiration date",
                        icon: Icon(
                          Icons.warning_amber_rounded,
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
