import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/club_layout/home_club.dart';
import 'package:khair_zaman/modules/clubApp/club_login/cubit/states.dart';
import 'package:khair_zaman/shared/component/constants.dart';

class ClubLoginCubit extends Cubit<ClubLoginStates>
{
  ClubLoginCubit():super(ClubLoginIntialState());

  static ClubLoginCubit get(context)=>BlocProvider.of(context);

  bool login =false;
   void userLogin({
  required String email,
  required String password,
     var context,
})
   {
     emit(ClubLoginLoadingState());

     FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password
     ).then((value)
     {
       Navigator.push(context,
           MaterialPageRoute(
               builder: (context)=>HomeClub()));
       print('club_login seccess');
       emit(ClubLoginSuccessState());
       login=true;
     }
     ).catchError((error)
     {
       login=false;
       emit(ClubLoginErrorState(error.toString()));
     });
   }



}