
import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'chat.dart';

class PanelWidget extends StatefulWidget{
  final ScrollController controller;
  const PanelWidget({
    Key? key,
    required this.controller,
}) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {

  int? _value = 1;


  @override
  Widget build(BuildContext context) => ListView(
    padding: EdgeInsets.zero,
    children: <Widget> [
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
            Text("What 's your problem",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:Mycolor.darkblue ),),
          ],
        ),

       Container(

            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, top: 20,),
            child:DropdownButton(
              dropdownColor: Mycolor.Beige,
              value: _value,
              items: const [
                DropdownMenuItem(
                  child: Text("Filling With Gasoline",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold, color: Colors.black),),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Charging Battery",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,color: Colors.black),),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Drag to the nearest Service",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,color: Colors.black),),
                  value: 3,
                ),

              ],

              onChanged: (int? value) {
                setState(() {
                  _value = value;});
              },
              //  hint:Text("Select item"),
            ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hoverColor: Colors.white,
                  hintText:
                  "other",
                ),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(left: 50,top: 20, right: 50,),
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
                  },
                  child: const Text(
                    'Request',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
        ),

      /*  Row(
          children: [
            Text("Nissan 2018 color:red",
              style: TextStyle(fontWeight: FontWeight.w600,
                color: Mycolor.darkblue,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 60),
            Icon(
              Icons.call,
              size: 30,
              color: Mycolor.darkblue,
            ),
            SizedBox(width: 20),

            IconButton(
              icon: Image.asset('assets/images/chat.png'),
              iconSize: 30.0,
              color: Mycolor.darkblue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return  ChatScreen();
                    }));
              },
           ),

          ],
        ), */

      ],
    ),
  );
}