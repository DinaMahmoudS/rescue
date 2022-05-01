import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue2/screens/Home.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/user_signup/cubit.dart';
import 'package:rescue2/screens/user_signup/states.dart';

class Signup2 extends StatefulWidget {
   Signup2({Key? key}) : super(key: key);

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  var car_modelController = TextEditingController();
  var car_colorController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> UserSignupCubit(),
        child: BlocConsumer<UserSignupCubit, UserSignupStates>(
        listener: (context, state) {
      if(state is CreateUserSuccessState)
      {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return const Home();
            }));

      }
    },
    builder: (context, state) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Mycolor.white,
          child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Row(
                      children: const [
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80,),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Form(
                      key: formKey,

                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Color(0xFF59769E),
                                    )
                                )
                            ),
                            child: TextFormField(
                              controller: car_modelController,

                              validator: (value){
                                if (value!.isEmpty)
                                {
                                  return'please enter your car/s model';
                                }
                              },

                              decoration: InputDecoration(
                                hintText: "Car's model",
                                prefixIcon: Icon(
                                  Icons.directions_car_rounded,
                                ),
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Color(0xFF59769E),
                                    )
                                )
                            ),
                            child: TextFormField(
                              controller: car_colorController,

                              validator: (value){
                                if (value!.isEmpty)
                                {
                                  return'please enter your car/s color';
                                }
                              },

                              decoration: InputDecoration(
                                hintText: "Car's color",
                                prefixIcon: Icon(
                                  Icons.directions_car_rounded,
                                  color: Mycolor.teal,
                                ),
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),

                            child:  buildButton(
                              title: 'Commercial Registration photo',
                              icon: Icons.image_outlined,
                              prefixIcon: Mycolor.teal,
                              onClicked: () {},
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 60,),

                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Mycolor.red,
                            fixedSize: const Size(300, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()){
                              UserSignupCubit.get(context).userSignup(
                                email: '',
                                name: '',
                                number: '',
                                em_number: '',
                                password:'',
                                image: '',

                                car_model: car_modelController.text,
                                car_color: car_colorController.text,

                              );
                            }
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
    },
        ),
    );
  }
}
