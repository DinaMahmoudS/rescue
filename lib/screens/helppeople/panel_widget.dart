
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

        Row(
          children: [
            Text("Mahmoud Ahmed",
                style: TextStyle(fontWeight: FontWeight.w600,
                    color: Colors.black,
                  fontSize: 25,
                ),
            ),
            SizedBox(width: 90),
            Text("12KM",
              style: TextStyle(fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        Row(
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
        ),

      ],
    ),
  );
}