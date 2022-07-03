import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/navigation_bar.dart';

class SpareParts extends StatefulWidget {
  const SpareParts({Key? key}) : super(key: key);

  @override
  State<SpareParts> createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Mycolor.darkblue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          title: const Text(
            "Spare Parts",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          leading:
              //This is the arrow icon
              IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const Home();
                    }));
                  }),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Image.asset(
                  "assets/car_parts/81NM-a3xoyL._AC_SY879_.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill),
              title: const Text("Kia",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: const Text(
                  "External wheel pan for the car, with a diameter of 13 inches, with a distinctive sporty shape, made in China, black x white color",
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Image.asset(
                  "assets/car_parts/photo_2022-06-27_00-23-58.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill),
              title: const Text("Kia",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: const Text("TRD Performance Exhaust System",
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Image.asset(
                  "assets/car_parts/photo_2022-06-27_00-23-59.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill),
              title: const Text("Kia",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: const Text("Brakes , TRD , High Peformance Brake Kit",
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Image.asset(
                  "assets/car_parts/photo_2022-06-27_00-24-00.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill),
              title: const Text("Toyota",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: const Text("TRD 18 - in . 5 - Spoke Alloy Wheels",
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Image.asset(
                  "assets/car_parts/photo_2022-06-27_00-24-00 (3).jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill),
              title: const Text("Toyota",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: const Text(
                  "Genuine parts made especially for your Toyota",
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ));
  }
}
