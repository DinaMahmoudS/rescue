import 'dart:developer';

import 'package:flutter/material.dart';

class ButtomSheatHelper extends StatefulWidget {
  const ButtomSheatHelper({Key? key}) : super(key: key);

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
                    "Reminder!",
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
              "Don't forget to get your maintenance done on time",
              style: TextStyle(color: Colors.black),
            )
          ],
        ));
  }
}
