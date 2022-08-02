
abstract class LoginStates {}

class LoginIntialState extends LoginStates {}

class LoginLodingState extends LoginStates {}

class LoginSucsesState extends LoginStates {
  final String? uId;

  LoginSucsesState(this.uId);
}

class LoginerrorState extends LoginStates {
  final String Error;

  LoginerrorState(this.Error);
}

class ChangePasswordVisibiltyState extends LoginStates {}
