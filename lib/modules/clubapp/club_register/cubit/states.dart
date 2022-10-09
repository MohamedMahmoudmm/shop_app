abstract class ClubRegisterStates{}

class ClubRegisterInitialState extends ClubRegisterStates{}
class ClubRegisterLoadingState extends ClubRegisterStates{}
class ClubRegisterSuccessState extends ClubRegisterStates{}
class ClubRegisterErrorState extends ClubRegisterStates{
  late final String error;

  ClubRegisterErrorState(this.error);
}
class ClubCreateUserSuccessState extends ClubRegisterStates{}
class ClubCreateUserErrorState extends ClubRegisterStates{
  late final String error;

  ClubCreateUserErrorState(this.error);
}

