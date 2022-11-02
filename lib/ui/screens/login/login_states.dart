abstract class LoginStates {}

///The initial state of the login screen.
class LoginInitialStates extends LoginStates {}

///Loading state of the login screen.
class LoginLoadingState extends LoginStates {}

///The error state of the login screen.
class LoginErrorState extends LoginStates {
  final String message;

  LoginErrorState({required this.message});
}
