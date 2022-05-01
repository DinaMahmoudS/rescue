import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/Home.dart';

import '../Battery/Battery.dart';
import '../Brakes/Brakes.dart';
import '../Engine Oil/Engine Oil.dart';
import '../Gear Box/Gear Box.dart';
import '../Milage/Milage.dart';
import '../Timeline/Timeline.dart';
import '../Tires/Tires.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  _Main_ScreenState createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
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
        child: Scaffold(
//This is the background color of the screen
          backgroundColor: Colors.transparent,
          //This is the top app bar that contains the title of the screen an the icons on the top of the screen
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
              ("Maintenance"),
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
                        return Home();
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
                      child: Image.asset("assets/images/repair-tools.png"))),
            ],
          ),
          //This is the body of the code which i wrapped with the "Center" widget to make the body in the center of the screen
          body: Center(
            //This is the column that contains my buttons
            child: Column(
              //These two next line to adjust the column position in the center of the screen
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              //Here are the children of the column or in this case the place where the buttons are
              children: [
                //First Button #1
                ElevatedButton(
                  //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                  style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                  child: Row(
                    //The children of the row widget which are in this case text and icon
                    children: [
                      //The text to be written inside the button
                      Text(
                        "Milage",
                        //The style of the text in this case whether the font is bold or not and the color of text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      //This is the icon itself
                      Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Container(
                            width: 40,
                            height: 30,
                            child:
                                Image.asset("assets/images/speedometer.png")),
                      ),
                    ],
                  ),
                  //This is the function or the action that will be done when the user presses this specific button
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Milage();
                    }));
                  },
                ),
                //This box is used to put space between the buttons
                SizedBox(
                  height: 10,
                  width: 30,
                ),
                //Second Button #2
                ElevatedButton(
                  //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                  style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                  child: Row(
                    //The children of the row widget which are in this case text and icon
                    children: [
                      //The text to be written inside the button
                      Text(
                        "Engine Oil",
                        //The style of the text in this case whether the font is bold or not and the color of text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      //This is the icon itself
                      Padding(
                        padding: EdgeInsets.only(left: 160),
                        child: Container(
                            width: 40,
                            height: 30,
                            child: Image.asset("assets/images/car-oil.png")),
                      ),
                    ],
                  ),
                  //This is the function or the action that will be done when the user presses this specific button
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Engine_Oil();
                    }));
                  },
                ),
                //This box is used to put space between the buttons
                SizedBox(
                  height: 10,
                  width: 30,
                ),
                //Third Button #3
                ElevatedButton(
                  //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                  style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                  child: Row(
                    //The children of the row widget which are in this case text and icon
                    children: [
                      //The text to be written inside the button
                      Text(
                        "Brakes",
                        //The style of the text in this case whether the font is bold or not and the color of text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      //This is the icon itself
                      Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Container(
                            width: 40,
                            height: 30,
                            child: Image.asset("assets/images/brake-disc.png")),
                      ),
                    ],
                  ),
                  //This is the function or the action that will be done when the user presses this specific button
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Brakes();
                    }));
                  },
                ),
                //This box is used to put space between the buttons
                SizedBox(
                  height: 10,
                  width: 30,
                ),
                //Fourth Button #4
                ElevatedButton(
                  //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                  style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                  child: Row(
                    //The children of the row widget which are in this case text and icon
                    children: [
                      //The text to be written inside the button
                      Text(
                        "Gear Box",
                        //The style of the text in this case whether the font is bold or not and the color of text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      //This is the icon itself
                      Padding(
                        padding: EdgeInsets.only(left: 170),
                        child: Container(
                            width: 40,
                            height: 30,
                            child: Image.asset("assets/images/gearbox.png")),
                      ),
                    ],
                  ),
                  //This is the function or the action that will be done when the user presses this specific button
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Gear_Box();
                    }));
                  },
                ),
                //This box is used to put space between the buttons
                SizedBox(
                  height: 10,
                  width: 30,
                ),
                //Fifth Button #5
                ElevatedButton(
                  //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                  style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                  child: Row(
                    //The children of the row widget which are in this case text and icon
                    children: [
                      //The text to be written inside the button
                      Text(
                        "Tires",
                        //The style of the text in this case whether the font is bold or not and the color of text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      //This is the icon itself
                      Padding(
                        padding: EdgeInsets.only(left: 195),
                        child: Container(
                            width: 40,
                            height: 30,
                            child: Image.asset("assets/images/tires.png")),
                      ),
                    ],
                  ),
                  //This is the function or the action that will be done when the user presses this specific button
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Tires();
                    }));
                  },
                ),
                //This box is used to put space between the buttons
                SizedBox(
                  height: 10,
                  width: 30,
                ),
                //Sixth Button #6
                ElevatedButton(
                  //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                  style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                  child: Row(
                    //The children of the row widget which are in this case text and icon
                    children: [
                      //The text to be written inside the button
                      Text(
                        "Battery",
                        //The style of the text in this case whether the font is bold or not and the color of text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      //This is the icon itself
                      Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Container(
                            width: 40,
                            height: 30,
                            child:
                                Image.asset("assets/images/car-battery.png")),
                      ),
                    ],
                  ),
                  //This is the function or the action that will be done when the user presses this specific button
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Battery();
                    }));
                  },
                ),
                //This box is used to put space between the buttons
                SizedBox(
                  height: 10,
                  width: 30,
                ),
                //Seventh Button #7
                ElevatedButton(
                  //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                  style: ElevatedButton.styleFrom(
                      primary: Mycolor.red,
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                  child: Row(
                    //The children of the row widget which are in this case text and icon
                    children: [
                      //The text to be written inside the button
                      Text(
                        "Timeline",
                        //The style of the text in this case whether the font is bold or not and the color of text
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      //This is the icon itself
                      Padding(
                        padding: EdgeInsets.only(left: 170),
                        child: Container(
                            width: 40,
                            height: 30,
                            child:
                                Image.asset("assets/images/timeline (1).png")),
                      ),
                    ],
                  ),
                  //This is the function or the action that will be done when the user presses this specific button
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Timeline();
                    }));
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
