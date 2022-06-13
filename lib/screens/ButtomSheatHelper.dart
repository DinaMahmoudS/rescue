import 'dart:developer';

import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'helppeople/chat.dart';

class ButtomSheatHelper extends StatefulWidget {
  String name , phone , carModel ;
   ButtomSheatHelper({Key? key , required this.name , required this.phone , required this.carModel}) : super(key: key);

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
                  padding: const EdgeInsets.only(left: 120),
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
            SizedBox(height: 100),
            Text(
              "name = ${widget.name} \n phone =${widget.phone} \n car model= ${widget.carModel}",
              style: TextStyle(color: Colors.black),
            ),

            SizedBox(height: 10,),

            Row(children: [
              IconButton(onPressed: (){

                _launchURL("tel:${widget.phone}");
              }, icon: Icon(Icons.phone)),
              SizedBox(width: 10,),

              IconButton(onPressed: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ChatScreen()));
                _launchURL("tel:${widget.phone}");
              }, icon: Icon(Icons.chat)),

            ],)

          ],
        ));
  }
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
