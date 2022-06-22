import 'package:flutter/material.dart';
import 'package:rescue2/screens/chat.dart';
import 'package:rescue2/screens/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          color: Mycolor.white,
        ),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Mycolor.darkblue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              title: Text(widget.title),
              centerTitle: true,
            ),
            body: Center(child: Chat())),
      ),
    );
  }
}
