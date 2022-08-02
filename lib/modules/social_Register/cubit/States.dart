abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

class RegisterLodingState extends RegisterStates {}

class RegisterSucseslState extends RegisterStates {}

class RegisterErerorState extends RegisterStates {
  final String Error;

  RegisterErerorState(this.Error);
}


class CreateUserLodingState extends RegisterStates {}

class CreateUserSucseslState extends RegisterStates {

}

class CreateUserErerorState extends RegisterStates {
  final String Error;

  CreateUserErerorState(this.Error);
}

class RegisterChangePasswordVisibiltyState extends RegisterStates {}
