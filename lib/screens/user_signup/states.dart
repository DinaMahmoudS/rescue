abstract class UserSignupStates {}

class UserSignupInitialState extends UserSignupStates {}

class UserSignupLoadingState extends UserSignupStates {}

class UserSignupSuccessState extends UserSignupStates {}

class UserSignupErrorState extends UserSignupStates
{
  final String error;
  UserSignupErrorState(this.error);
}

class CreateUserSuccessState extends UserSignupStates {}

class CreateUserErrorState extends UserSignupStates
{
  final String error;
  CreateUserErrorState(this.error);
}