import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/modules/clubapp/club_register/cubit/cubit.dart';
import 'package:khair_zaman/modules/clubapp/club_register/cubit/states.dart';
import 'package:khair_zaman/shared/component/constants.dart';

class ClubRegisterScreen extends StatelessWidget {
  const ClubRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();
    var nameController=TextEditingController();
    var emailController=TextEditingController();
    var phoneController=TextEditingController();
    var passwordController=TextEditingController();
    return BlocProvider(
        create:(BuildContext context)=>ClubRegisterCubit(),
      child: BlocConsumer<ClubRegisterCubit,ClubRegisterStates>(
        listener: (context,state){},
        builder: (context,state){

          return Scaffold(
            appBar: AppBar(
              title: Text('REGISTER'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            color: defaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'JOIN TO our club app',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      TextFormField(
                        controller: nameController,

                        decoration: InputDecoration(

                          label: Text(
                            'Enter Your name',
                            style: TextStyle(
                              color: defaultColor,
                            ),
                          ),
                          hintText: 'please enter your name',
                        ),
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return'not valid name';
                          }

                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email_outlined,
                            color: defaultColor,),
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
                        controller: phoneController,

                        decoration: InputDecoration(

                          label: Text(
                            'Your phone number',
                            style: TextStyle(
                              color: defaultColor,
                            ),
                          ),
                          hintText: '01*********',
                        ),
                        validator: (value)
                        {
                          if(value!.isEmpty||value.length!=11)
                          {
                            return'wrong number';
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
                                  print('club_register seccess');
                                  ClubRegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text);

                                }
                              },
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
