abstract class NewsStates{}

class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}

class NewsLoadingState extends NewsStates{}
class NewsGetDataSuccessState extends NewsStates{}
class NewsGetDataErrorState extends NewsStates
{
  final String error;
  NewsGetDataErrorState(this.error);

}
class NewsGetSportsDataSuccessState extends NewsStates{}
class NewsGetSportsDataErrorState extends NewsStates
{
  final String error;
  NewsGetSportsDataErrorState(this.error);

}