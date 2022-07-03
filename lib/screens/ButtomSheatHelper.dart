import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'helppeople/chat.dart';

class ButtomSheatHelper extends StatefulWidget {
  String name, phone, carModel;

  ButtomSheatHelper(
      {Key? key,
      required this.name,
      required this.phone,
      required this.carModel})
      : super(key: key);

  @override
  _ButtomSheatHelperState createState() => _ButtomSheatHelperState();
}

class _ButtomSheatHelperState extends State<ButtomSheatHelper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Container(
                    child: Text(
                      "${widget.name}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Container(
                  child: Text(
                    "   name : ${widget.name}  ",
                    style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold,),

                  ),

                ),
                 SizedBox(width: 100,),

                 IconButton(
                    onPressed: () {
                      _launchURL("tel:${widget.phone}");
                    },
                    icon: Icon(Icons.phone,color: Mycolor.red,size: 30,)),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ChatScreen()));
                    },
                    icon: Icon(Icons.chat,color: Mycolor.red,size: 30)),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "   phone : ${widget.phone}  ",
                    style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  child: Text(
                    "   car model : ${widget.carModel}",
                    style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
