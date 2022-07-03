import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rescue2/screens/colors.dart';

var Content, Date;

void showToast() => Fluttertoast.showToast(
      msg: "Saved",
      fontSize: 18,
      backgroundColor: Mycolor.darkblue,
      timeInSecForIosWeb: 3,
    );

void showToast2(String msg) => Fluttertoast.showToast(
      msg: msg,
      fontSize: 18,
      backgroundColor: Mycolor.red,
      timeInSecForIosWeb: 3,
    );

String printText(
    {required String UID, required String coll, required String doc}) {
  FirebaseFirestore.instance
      .collection("Maintenance")
      .doc(UID)
      .collection(coll)
      .doc(doc)
      .get()
      .then((value) {
    Content = value.get("Content").toString();
    Date = value.get("Date").toString();
  }).onError((error, stackTrace) {
    Content = "content = ${error.toString()}";
    Date = "date = ${error.toString()}";
  });
  if (Content != null && Date != null) return "${Content} ${Date} ";
  return "${Content}  ${Date} ";
}

Future createData(
    {required String coll,
    required String coll2,
    required String doc,
    required String data}) async {
  final docMilage = FirebaseFirestore.instance
      .collection(coll)
      .doc(doc)
      .collection(coll2)
      .doc(coll2);
  final json = {
    'Content': data,
    'Date': DateTime.now().toString(),
    'name': coll2
  };
  await docMilage.set(json).then((value) {
    showToast2("Done");
  }).onError((error, stackTrace) {
    showToast2(error.toString());
  });
}
