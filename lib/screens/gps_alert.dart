import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/home.dart';

class Gps extends StatelessWidget {
  const Gps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Mycolor.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CupertinoAlertDialog(
              title: Text("Accept"),
          content: Text("do you accept"), //can be image
                  actions: [
                    CupertinoAlertDialog(),
                    CupertinoAlertDialog(),
                  ],
          ),

              ]),
        ),
      ),
    );
  }
}
