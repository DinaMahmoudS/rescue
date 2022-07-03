import 'package:flutter/material.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/navigation_bar.dart';

class CarAgency extends StatefulWidget {
  const CarAgency({Key? key}) : super(key: key);

  @override
  State<CarAgency> createState() => _CarAgencyState();
}

class _CarAgencyState extends State<CarAgency> {
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

          // actions: const [ Icon(Icons.chat_outlined )],
          title: const Text(
            "Car Agency",
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: Image.asset(
                    "assets/car_agency/101px-Mercedes-Logo.svg.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill),
                title:
                    const Text("Mercedes", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold )),
                subtitle: const Text(
                    "ستار الوطنية للسيارات فرع القطامية - مرسيدس بنز SNA",
                    style: TextStyle(color: Colors.black)),
                trailing: Text("02 37250031",
                    style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                leading: Image.asset("assets/car_agency/700px-Nissan_logo.png",
                    height: 100, width: 100, fit: BoxFit.fill),
                title:
                    const Text("Nissan", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold )),
                subtitle: const Text(
                    "شارع التسعين الجنوبى, قسم أول القاهرة الجديدة، محافظة القاهرة",
                    style: TextStyle(color: Colors.black)),
                trailing: Text("02 21600194",
                    style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                leading: Image.asset("assets/car_agency/800px-Kia-logo.png",
                    height: 100, width: 100, fit: BoxFit.fill),
                title: const Text("Kia", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold )),
                subtitle: const Text("بركة النصر، قسم أول السلام، محافظة القاهرة",
                    style: TextStyle(color: Colors.black)),
                trailing: Text("02 35391481",
                    style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                leading: Image.asset("assets/car_agency/BMW_logo_(gray).svg.png",
                    height: 100, width: 100, fit: BoxFit.fill),
                title: const Text("BMW", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold )),
                subtitle: const Text(
                    "Katameya Maadi Ring Road، Cairo، محافظة القاهرة",
                    style: TextStyle(color: Colors.black)),
                trailing: Text("0122 313 6724",
                    style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                leading: Image.asset("assets/car_agency/toyota.jpg",
                    height: 100, width: 100, fit: BoxFit.fill),
                title:
                    const Text("toyota", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold )),
                trailing: Text("02 24883500",
                    style: TextStyle(color: Colors.black)),
                subtitle: const Text(
                    "10 شارع المستشفى اليوناني، السرايات، الوايلى، محافظة القاهرة",
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ));
  }
}
