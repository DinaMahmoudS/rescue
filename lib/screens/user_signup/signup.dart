import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rescue2/screens/Home.dart';
import 'package:rescue2/screens/colors.dart';
import 'package:rescue2/screens/user_signup/cubit.dart';
import 'package:rescue2/screens/user_signup/common_photo_register.dart';
import 'package:rescue2/screens/user_signup/states.dart';
import 'package:app_settings/app_settings.dart';
import '../user_login/login.dart';
import 'package:flutter/rendering.dart';
import 'package:rescue2/screens/user_login/flutter_toast.dart';

class Signup extends StatefulWidget {
   Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

   var numberController = TextEditingController();

   var em_numberController = TextEditingController();

   var passwordController = TextEditingController();

  var car_modelController = TextEditingController();
  var car_colorController = TextEditingController();
  var image = TextEditingController();


   final formKey = GlobalKey<FormState>();

   //File? image;

   Future pickImage() async{
       try {
           final image = await ImagePicker().pickImage(
               source: ImageSource.gallery);
           if (image == null) return;

           final imageTemporary = File(image.path);
           setState(() => this.image = imageTemporary as TextEditingController);
       } on PlatformException catch (e){
           print('falid to pick');
       }
   }


   bool _isObscure = true;


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
                AppSettings.openLocationSettings();
            }

            if(state is UserSignupErrorState)
            {
                return showToast2();

            }
        },
        builder: (context, state) {

            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
              body: Container(
                  alignment: Alignment.center,
      color: Colors.white,
      child: SingleChildScrollView(
      child: Column(
      children: <Widget>[
      SizedBox(height: 50,),
      Padding(
      padding: EdgeInsets.only(right: 30, left: 30),

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
      ), ),

      const SizedBox(height: 30,),
      Padding(
      padding: EdgeInsets.only(right: 30, left: 30),

      child: Form(
      key: formKey,
      child: Column(
      children: <Widget>[
      Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      border: Border(
      bottom: BorderSide(color: Color(0xFF59769E),
      )
      )
      ),
      child: TextFormField(
      controller: nameController,

      validator: (value){
      if (value!.isEmpty)
      {
      return'please enter your full name';
      }
      return null;
      },

      decoration: InputDecoration(
      hintText: "Full Name",
      prefixIcon: Icon(
      Icons.person,
      color: Mycolor.teal,
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
      controller: emailController,


      validator: (value){

      if (value!.isEmpty)
      {
      return'please enter your email';
      }
      onChanged: (val){
          setState(() => emailController= val as TextEditingController);
      };
      },

      decoration: InputDecoration(
      hintText: "E-mail",
      prefixIcon: Icon(
      Icons.email,
      color: Mycolor.teal,
      ),
      border: InputBorder.none
      ),
      keyboardType: TextInputType.emailAddress,
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
      controller: numberController,

      validator: (value){

      if (value!.isEmpty)
      {
      return'please enter your number';
      }
      return null;
      },

      decoration: InputDecoration(
      hintText: "Number",

      prefixIcon: Icon(
      Icons.call_rounded,
      color: Mycolor.teal,
      ),
      border: InputBorder.none
      ),
          maxLength: 11,
      keyboardType: TextInputType.number,
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
      controller: em_numberController,
      validator: (value){

      if (value!.isEmpty)
      {
      return'please enter emergency number';
      }
      return null;
      },

      decoration: InputDecoration(
      hintText: "Enter an Emergency Call Number",
      prefixIcon: Icon(
      Icons.call_rounded,
      color: Mycolor.teal,
      ),
      border: InputBorder.none
      ),
          maxLength: 11,
      keyboardType: TextInputType.number,
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
      controller: passwordController,


      validator: (value){

      if (value!.isEmpty)
      {
      return'please enter your password';
      }
      if (value.length < 6)
      {
      return'The password you entered is less than 6 characters';
      }
      onChanged: (val){
          setState(() => passwordController= val as TextEditingController);
      };
      },

      obscureText: _isObscure,
      decoration: InputDecoration(
      hintText: "Password",

      suffixIcon: IconButton(
      icon: Icon(
      _isObscure ? Icons.visibility_off : Icons.visibility,
      color: Mycolor.teal,),
      onPressed: () {
      setState(() {
      _isObscure = !_isObscure;
      });
      },
      ),

      prefixIcon: Icon(
      Icons.lock,
      color: Mycolor.teal,
      ),

      border: InputBorder.none
      ),
      keyboardType: TextInputType.visiblePassword,
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
                  onClicked: () =>pickImage(),
              ),
          ),

      ],
      ),
      ),
      ),
      SizedBox(height: 20),


          ConditionalBuilder(
              condition:state is! UserSignupLoadingState,
              builder:(context)=>

      ElevatedButton(
      style: ElevatedButton.styleFrom(
      primary: Mycolor.red,
      fixedSize: const Size(300, 43),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
      ),
      ),

      onPressed: () {
      if (formKey.currentState!.validate()){
          UserSignupCubit.get(context).userSignup(
          email: emailController.text,
          name: nameController.text,
          number: numberController.text,
          em_number: em_numberController.text,
          password: passwordController.text,
              car_color: car_colorController.text,
              car_model: car_modelController.text,
              image: image.text,

          );
      } AppSettings.openLocationSettings();
      //  return Signup2();

      },

      child: const Text('Sign up',
      style: TextStyle(
      fontSize: 18,
      ))

      ),
              fallback:(context)=> CircularProgressIndicator(),
      ),




      const SizedBox(height: 30),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Text(
      "Already have an Account?",
      style: TextStyle(
      fontSize: 15,
      ),
      ),
      TextButton(
      onPressed: () {
      Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
      return Login();
      }));
      },
      child: Text(
      "Log In",
      style: TextStyle(
      color: Mycolor.teal,
      ),
      )),
      ],
      ),
      ],


      ),

      ),
      ),

      )
            );

        },
        ),
      ); //this the widget that contain body and appbar
  }
}


