import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/club_layout/home_club.dart';
import 'package:khair_zaman/modules/clubApp/club_login/cubit/states.dart';
import 'package:khair_zaman/modules/clubapp/club_login/cubit/cubit.dart';
import 'package:khair_zaman/modules/clubapp/club_register/register_screen.dart';
import 'package:khair_zaman/shared/component/constants.dart';



class ClubLoginScreen extends StatelessWidget {

  const ClubLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var formKey=GlobalKey<FormState>();
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    return BlocProvider(
        create: (BuildContext context)=>ClubLoginCubit(),
    child: BlocConsumer<ClubLoginCubit,ClubLoginStates>(
    listener: (context,state){
      if(state is ClubLoginErrorState)
        {
          // showToast(
          //   text:state.error,
          //   state:ToastStates.ERROR,
          // )
        }
    },
      builder: (context,state){
      return  Scaffold(
        backgroundColor: defaultColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //color: Colors.deepPurple,
                width: double.infinity,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sports_soccer_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'THE CLUP',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              color: defaultColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          'hello in our club app',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        TextFormField(
                          controller: emailController,

                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email_outlined),
                            label: Text(
                              'email',
                              style: TextStyle(
                                color: defaultColor,
                              ),
                            ),
                            hintText: '@gmail.com',
                          ),
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return'not valid email';
                            }

                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye_rounded,
                              color: defaultColor,),
                            label: Text(
                              'password',
                              style: TextStyle(
                                color: defaultColor,
                              ),
                            ),
                            hintText: '********',
                          ),
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return'enter password';
                            }

                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: defaultColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate())
                                  {

                                    ClubLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        context: context,
                                        password: passwordController.text);
                                    // if(ClubLoginCubit.get(context).login==true){
                                    //   Navigator.push(context,
                                    //       MaterialPageRoute(
                                    //           builder: (context)=>HomeClub()));
                                    // }

                                  }
                                },
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Your first time?',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>ClubRegisterScreen(),
                                      )
                                  );
                                },
                                child: Text('REGISTER NOW',
                                style: TextStyle(color: defaultColor),)
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
      },
    ),);
  }
}
