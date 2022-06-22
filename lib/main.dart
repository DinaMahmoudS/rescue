import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue2/bloc_observer.dart';
import 'package:rescue2/network/remote/dio_helper.dart';

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
        ),
        debugShowCheckedModeBanner: false,
        // this SplashScreen
        home: SplashScreen(),
      ));
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
}
