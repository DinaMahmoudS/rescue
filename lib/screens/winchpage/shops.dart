import 'package:flutter/material.dart';
import 'package:rescue2/screens/winchpage/item.dart';

import '../colors.dart';

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycolor.darkblue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),

        // leading: const Icon(Icons.menu_open_rounded, color: Colors.red, ),

        // actions: const [ Icon(Icons.chat_outlined )],
        title: const Text(
          "Shops",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Item(context,text: "10 km"),
              Item(context,text: "30 km"),
              Item(context,text: "20 km"),
              Item(context, text: "15 km"),

            ],
          ),
        ),
      ),
    );
  }
}
