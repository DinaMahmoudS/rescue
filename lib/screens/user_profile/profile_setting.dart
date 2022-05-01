import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/user_signup/signup2.dart';


class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

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
        child: TextField(
          decoration: InputDecoration(
              hintText: "Name",
              prefixIcon: Icon(
                Icons.person,
                color: Mycolor.teal,
              ),
              border: InputBorder.none
          ),
          keyboardType: TextInputType.text,
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
              hintText: "Number",
              prefixIcon: Icon(
                Icons.call_rounded,
                color: Mycolor.teal,
              ),
              border: InputBorder.none
          ),
          keyboardType: TextInputType.number,
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
              hintText: "Enter an Emergency Call Number",
              prefixIcon: Icon(
                Icons.call_rounded,
                color: Mycolor.teal,
              ),
              border: InputBorder.none
          ),
          keyboardType: TextInputType.number,
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
        child: const TextField(
          decoration: InputDecoration(
              hintText: "Car's model",
              prefixIcon: Icon(
                Icons.directions_car_rounded,
              ),
              border: InputBorder.none
          ),
          keyboardType: TextInputType.text,
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
              hintText: "Car's color",
              prefixIcon: Icon(
                Icons.directions_car_rounded,
                color: Mycolor.teal,
              ),
              border: InputBorder.none
          ),
          keyboardType: TextInputType.text,
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
              hintText: "Driving License",
              prefixIcon: Icon(
                Icons.topic_outlined,
                color: Mycolor.teal,
              ),
              border: InputBorder.none
          ),
          keyboardType: TextInputType.number,
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
      ),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Signup2();
                              }));
                        },
                        child: const Text('Save',
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
    ); //this the widget that contain body and appbar
  }
}
