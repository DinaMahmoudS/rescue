
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue2/bloc_observer.dart';
import 'package:rescue2/network/remote/dio_helper.dart';
//import 'package:splash_screen/animated_splash_screen.dart';
//import 'package:page_transition/page_transition.dart';
import 'package:rescue2/screens/SplashScreen.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
        () {
      runApp(
// entry point MaterialApp
          MaterialApp(
           title: 'rescue',
          theme: ThemeData(
          primarySwatch: Colors.blue,
          //visualDensity: VisualDensity.adaptivePlatformDensity,
         // brightness: Brightness.dark,
           ),
           debugShowCheckedModeBanner: false,
           // this SplashScreen
           home: SplashScreen(),
        //Guest(),
      ));
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),

  );
  DioHelper.init();
}
