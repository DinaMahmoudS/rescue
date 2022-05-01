import'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/home.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
       child:SingleChildScrollView(
         child: Column(

           children:<Widget>[
             const SizedBox(height: 20),
             Image.asset(
               "assets/images/traffic.png",
               width: 170,
               height: 170,
             ),
             const SizedBox(height: 40),

             TextField(
               decoration:InputDecoration(
                 labelText: "Location",
                 labelStyle: TextStyle(
                     fontSize: 25,
                     color: Mycolor.darkblue,
                     fontWeight: FontWeight.bold ),
                 fillColor: Colors.black12,
                 filled: true,
                 border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                 hintText:'region,main street name,branch street name',
                   suffixIcon: Icon(Icons.send)
               ),
             ),
             SizedBox(height: 30),
                 TextField(
                 decoration:InputDecoration(
                   labelText: "What causes traffic congestion",
                     labelStyle: TextStyle(
                         fontSize: 20,
                         color: Mycolor.darkblue,
                         fontWeight: FontWeight.bold ),

                   fillColor: Colors.black12,
                 filled: true,
                 border:OutlineInputBorder(borderRadius:BorderRadius.circular(20),),
                 hintText:'ex accident',
                   suffixIcon: Icon(Icons.send)
          ),
          ),
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

