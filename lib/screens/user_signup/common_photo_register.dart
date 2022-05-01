import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rescue2/screens/colors.dart';


Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
  prefixIcon,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: TextStyle(fontSize: 25),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Mycolor.teal),
          const SizedBox(width: 16),
          Text(title
            ,style: TextStyle(
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
      onPressed: onClicked,
    );