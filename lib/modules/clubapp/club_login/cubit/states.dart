abstract class ClubLoginStates{}

class ClubLoginIntialState extends ClubLoginStates{}
class ClubLoginLoadingState extends ClubLoginStates{}
class ClubLoginSuccessState extends ClubLoginStates{}
class ClubLoginErrorState extends ClubLoginStates{
  late final String error;

  ClubLoginErrorState(this.error);
}