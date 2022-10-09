import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/club_layout/cubit/states.dart';
import 'package:khair_zaman/modules/clubapp/calendar/calendar.dart';
import 'package:khair_zaman/modules/clubapp/chat/chat.dart';
import 'package:khair_zaman/modules/clubapp/results/result.dart';

class ClubCubit extends Cubit<ClubStates> {
  ClubCubit() :super(ClubInitialState());

  static ClubCubit get(context) => BlocProvider.of(context);


  int currentIndex=2;

  List<String> title=[
    'النتائج',
    'المواعيد',
    'التحفيل'
  ];
  List<Widget> screen=[
    ResultScreen(),
    CalendarScreen(),
    ChatScreen()
  ];

  List<BottomNavigationBarItem> Items=[
    BottomNavigationBarItem(
        icon: Icon(Icons.play_arrow),
        label: 'النتائج'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_rounded),
        label: 'المواعيد'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'التحفيل'
    ),
  ];

  void changeNavBar(int index)
  {
    currentIndex=index;
    emit(ClubChangeBottomNavState());
  }
}