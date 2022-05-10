import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:app_settings/app_settings.dart';

void showToast()=> Fluttertoast.showToast(
  msg: "this email is not found",
      fontSize: 18,
  backgroundColor: Mycolor.darkblue,
   // AppSettings.openLocationSettings();

);
void showToast2(String msg)=> Fluttertoast.showToast(
  msg: msg,
  fontSize: 18,
  backgroundColor: Mycolor.darkblue,

);

Future createData({required String coll ,required String coll2 , required String doc,required String data}) async {
  final docMilage = FirebaseFirestore.instance.collection(coll).doc(doc).collection(coll2).doc(coll2);
  final json = {
    'Content':data,
    'Date':DateTime.now(),
  };
  await docMilage.set(json).then((value) {
    showToast2("Done");

  }).onError((error, stackTrace) {
    showToast2(error.toString());
  });
}