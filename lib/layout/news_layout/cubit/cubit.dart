

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/news_layout/cubit/states.dart';
import 'package:khair_zaman/modules/news/business/business.dart';
import 'package:khair_zaman/modules/news/sports/sports.dart';
import 'package:khair_zaman/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() :super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> Screens=
  [
    BusinessPage(),
    SportsPage()

  ];

  List<BottomNavigationBarItem> newsBottomItems=const[
     BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'sports'
    ),
    // BottomNavigationBarItem(
    //     icon: Icon(Icons.settings),
    //     label: 'settings'
    // )
  ];

  void navBar(int index)
  {
    currentIndex=index;
    emit(NewsBottomNavState());
  }
  List<dynamic> sports = [];
  void getSports()
  {
    //emit(NewsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);

      emit(NewsGetSportsDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsDataErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];
  void getBusiness()
  {
    //emit(NewsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetDataErrorState(error.toString()));
    });
  }
}