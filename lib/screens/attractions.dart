import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/home.dart';


class Attraction extends StatefulWidget {
  const Attraction({Key? key}) : super(key: key);

  @override
  _AttractionState createState() => _AttractionState();
}

class _AttractionState extends State<Attraction> {
  int? _value = 1;
  int? _value2 = 1;

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
        child: Column(
          children: [
            const SizedBox(height: 20,),

            const Image(image: AssetImage('assets/images/attraction.png'),height: 150,),
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
                      child: Text("Mazda",
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,color: Colors.black),),
                      value: 3,
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

            AnimatedButton(
              height: 50,
              width: 250,
              text: 'SUBMIT',
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              backgroundColor: const Color(0xff48B5D6),
            //  borderWidth: 3,
            //  borderColor: Mycolor.red,
              borderRadius: 50,
               onPress: () {  },
            ),


          ],
        ),
      ) ,
        ),
    ),
    );
  }
}