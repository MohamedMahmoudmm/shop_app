import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/prices/home_layout.dart';
import 'package:khair_zaman/modules/khairzaman/login/cubit/states.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() :super(ShopLoginIntialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  bool obscure=true;

  void showPassword()
  {
    if(obscure==false)
    {
      obscure=true;
    } else
    {
      obscure=false;
    }
    emit(ShopLoginSuccessState());
  }

  // bool login = false;
  // String? verificationCode;
  //
  // void userLogin({
  //   required String phoneNumber,
  //
  // })async
  // {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //       verificationCompleted:(PhoneAuthCredential credential)
  //       {
  //         FirebaseAuth.instance.signInWithCredential(credential)
  //             .then((value)
  //         {
  //           if(value.user !=null)
  //           {
  //             print('logg');
  //           }
  //           print('success');
  //           emit(ShopLoginSuccessState());
  //         });
  //
  //       },
  //       verificationFailed:( FirebaseAuthException exception)
  //       {
  //         print(exception.message);
  //         emit(ShopLoginErrorState());
  //
  //       },
  //       codeSent: (String verificationId ,int? resendToken)
  //       {
  //         verificationCode=verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId)
  //   {
  //     verificationCode=verificationId;
  //   },
  //   );
  //
  //
  // }
}