import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rescue2/pojo/winsh_data.dart';
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
        child: Expanded(
          child: StreamBuilder<List<Winshs>>(
            stream: readWinshs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final users = snapshot.data!;



                if (users.contains("false")) {
                  return Text(
                    "no friends for you",
                    style: TextStyle(color: Colors.black),
                  );
                } else {
                  // return Text("no friends you" , style: TextStyle(color: Colors.white),);
                  return ListView(
                    children: users.map(buildWinshs).toList(),
                  );
                }
              } else if (snapshot.hasError) {
                return Text(
                  "hasError ${snapshot.error}",
                  style: TextStyle(color: Colors.black),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Stream<List<Winshs>> readWinshs() =>
      FirebaseFirestore.instance.collection("winshs").snapshots().map(
          (event) => event.docs.map((e) => Winshs.fromJson(e.data())).toList());

  Widget buildWinshs(Winshs winshs) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Item(context,  location: winshs.location, phone: winshs.phone, status: winshs.status, name: winshs.name),
      );
}
