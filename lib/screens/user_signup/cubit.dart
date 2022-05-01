import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:rescue2/models/user_model.dart';
import 'package:rescue2/screens/user_signup/states.dart';
import 'package:url_launcher/url_launcher.dart';


class UserSignupCubit extends Cubit<UserSignupStates> {
  UserSignupCubit() : super(UserSignupInitialState());

  static UserSignupCubit get(context) => BlocProvider.of(context);

  void userSignup({
    required String email,
    required String password,
    required String name,
    required String number,
    required String em_number,
     required String car_model,
     required String car_color,
     required String image,
  }) {
    emit(UserSignupLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password)
        .then((value) {
      print(password);

      userCreate(
          email: email,
          name: name,
          number: number,
          em_number: em_number,
          password: password,
          car_model: car_model,
          car_color: car_color,
          image: image,
          uId: value.user!.uid);

      emit(UserSignupSuccessState());
    })
        .catchError((error) {
      print(email);

      emit(UserSignupErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String number,
    required String em_number,
    required String password,
    required String car_model,
    required String car_color,
    required String uId,
    required String image,
  })
  {
    UserModel model = UserModel(
        email: email,
        name: name,
        number: number,
        em_number: em_number,
        password: password,
        car_model: car_model,
        car_color: car_color,
        image: image,
        uId: uId
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(CreateUserSuccessState());
    })
        .catchError((error){
          emit(CreateUserErrorState(error.toString()));
    });
  }

}
