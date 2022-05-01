
abstract class UserLoginStates {}

class UserLoginInitialState extends UserLoginStates {}

class UserLoginLoadingState extends UserLoginStates {}

class UserLoginSuccessState extends UserLoginStates {}

class UserLoginErrorState extends UserLoginStates
{
  final String error;
  UserLoginErrorState(this.error);
}

