import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/models/club_app/club_user_model.dart';
import 'package:khair_zaman/modules/clubapp/club_register/cubit/states.dart';

class ClubRegisterCubit extends Cubit<ClubRegisterStates>
{
  ClubRegisterCubit():super(ClubRegisterInitialState());

  static ClubRegisterCubit get(context)=>BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  })
  {
    emit(ClubRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      print(value.user!.email);
      userCreate(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid);
      emit(ClubRegisterSuccessState());
    }).catchError((error){
      emit(ClubRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
})
  {
    ClubUserModel model=ClubUserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uId
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) 
    {
      emit(ClubCreateUserSuccessState());
    }
    ).catchError((error){
      emit(ClubCreateUserErrorState(error.toString()));
    });

  }



}