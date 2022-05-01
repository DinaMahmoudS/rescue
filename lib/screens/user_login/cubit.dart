import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue2/screens/user_login/states.dart';
import '../../network/remote/end_points.dart';


class UserLoginCubit extends Cubit<UserLoginStates> {
  UserLoginCubit() : super(UserLoginInitialState());

  static UserLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,

  }) {
    emit(UserLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    )
        .then((value) {
      emit(UserLoginSuccessState());
    })
        .catchError((error) {
      emit(UserLoginErrorState(error.toString()));
    });
  }
}



