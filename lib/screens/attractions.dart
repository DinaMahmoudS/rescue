import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rescue2/car_agency.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/navigation_bar.dart';
import 'package:rescue2/spare_parts.dart';


class Attraction extends StatefulWidget {
  const Attraction({Key? key}) : super(key: key);

  @override
  _AttractionState createState() => _AttractionState();
}

class _AttractionState extends State<Attraction> {
  int? _value = 1;
  int? _value2 = 1;
  String dropdownValue = 'Kia';
  String location ='Null, Press Button';
  String Address = 'search';

  Future  _getGeoLocationPosition() async{
    bool ServiceEnabled;
    LocationPermission locationPermission;
    ServiceEnabled=await Geolocator.isLocationServiceEnabled();
    if(!ServiceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location Service is disapled");
    }
    locationPermission=await Geolocator.checkPermission();
    if(locationPermission==LocationPermission.denied){
      locationPermission=await Geolocator.requestPermission();
      if(locationPermission==LocationPermission.denied){
        return Future.error("Location Permission is denied");
      }
    }
    if(locationPermission==LocationPermission.deniedForever){
      return Future.error("Location permissions are permanently denied, we cannot request permissions.");
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void>GetAddressFromLAtLong(Position position)async{
    List<Placemark>placemarks=await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place=placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          color: Mycolor.white,
        ),
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Mycolor.darkblue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),

            // actions: const [ Icon(Icons.chat_outlined )],
            title: const Text(
              "services",
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
          body:Container(
            color: Mycolor.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20,),

                  const Image(image: AssetImage('assets/images/attraction.png'),height: 130,),
                  const Text("What are your services on the road?",
                    style: TextStyle(fontSize: 18,color:Colors.black ),),

                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Kind Of Car",
                          style: TextStyle(fontSize: 22,
                              fontWeight: FontWeight.bold,color:Mycolor.darkblue ),),
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child:DropdownButton(
                      dropdownColor: Mycolor.Beige,
                      value: _value,
                      items: const [
                        DropdownMenuItem(
                          child: Text("KIA",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold, color: Colors.black),),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Nissan",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,color: Colors.black),),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("Toyota",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,color: Colors.black),),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("BMW",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,color: Colors.black),),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text("Mercedes",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,color: Colors.black),),
                          value: 5,
                        ),

                      ],

                      onChanged: (int? value) {
                        setState(() {
                          _value = value;});
                      },
                      //  hint:Text("Select item"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Services",
                          style: TextStyle(fontSize: 22,
                              fontWeight: FontWeight.bold,color:Mycolor.darkblue ),),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child:DropdownButton(
                        dropdownColor: Mycolor.Beige,
                        value: _value2,
                        items: const [
                          DropdownMenuItem(
                            child: Text("Change Battery",
                              style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.bold,color: Colors.black),),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Change wheels",
                              style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.bold,color: Colors.black),),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Tow",
                              style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.bold,color: Colors.black),),
                            value: 3,
                          ),

                        ],

                        onChanged: (int? value) {
                          setState(() {
                            _value2 = value;});
                        },
                        hint:const Text("Select item")
                    ),

                  ),
                  SizedBox(height: 10,),

                  ElevatedButton(
                    //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                    style: ElevatedButton.styleFrom(
                        primary: Mycolor.red,
                        fixedSize: Size(230, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //The children of the row widget which are in this case text and icon
                      children: [
                        //The text to be written inside the button
                        Text(
                          "SUBMIT",
                          //The style of the text in this case whether the font is bold or not and the color of text
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,fontSize: 18),
                        ),
                        //This is the icon itself

                      ],
                    ),
                    //This is the function or the action that will be done when the user presses this specific button
                    onPressed: () async {
                      Position position = await _getGeoLocationPosition();
                      location ='Lat: ${position.latitude} , Long: ${position.longitude}';
                      GetAddressFromLAtLong(position);
                      CollectionReference ref=FirebaseFirestore.instance.collection("attraction");
                      ref.add({"kind":dropdownValue,"location":Address,"services":_value2,"u_Id":"2oP1WoHfeAgiZ5BQuhLwZzj74dC3"});
                    },
                  ),
                  SizedBox(height: 10,),

                  ElevatedButton(
                    //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                    style: ElevatedButton.styleFrom(
                        primary: Mycolor.red,
                        fixedSize: Size(230, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //The children of the row widget which are in this case text and icon
                      children: [
                        //The text to be written inside the button
                        Text(
                          "Spare Parts",
                          //The style of the text in this case whether the font is bold or not and the color of text
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,fontSize: 18),
                        ),
                        //This is the icon itself

                      ],
                    ),
                    //This is the function or the action that will be done when the user presses this specific button
                    onPressed: ()  {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SpareParts(),));
                    },
                  ),
                  SizedBox(height: 10,),

                  ElevatedButton(
                    //This is the style and shape of the button on screen and i adjusted in this case tha color and size and the border shape
                    style: ElevatedButton.styleFrom(
                        primary: Mycolor.red,
                        fixedSize: Size(230, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    //I wrapped the text and icon with row widget to align their positions as i desire inside the button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //The children of the row widget which are in this case text and icon
                      children: [
                        //The text to be written inside the button
                        Text(
                          "Car Agency Info",
                          //The style of the text in this case whether the font is bold or not and the color of text
                          style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 18,),
                        ),
                        //This is the icon itself

                      ],
                    ),
                    //This is the function or the action that will be done when the user presses this specific button
                    onPressed: ()  {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => CarAgency(),));
                    },
                  ),


                ],
              ),
            ),
          ) ,
        ),
      ),
    );
  }
}