import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/prices/home_layout.dart';
import 'package:khair_zaman/modules/khairzaman/login/cubit/cubit.dart';
import 'package:khair_zaman/modules/khairzaman/login/cubit/states.dart';
import 'package:khair_zaman/shared/component/constants.dart';
import 'package:khair_zaman/shared/network/local/cache_helper.dart';



class ShopLoginScreen extends StatelessWidget {

  const ShopLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var formKey=GlobalKey<FormState>();
    var phoneController=TextEditingController();
    var passwordController=TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state){

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
                         // IconBroken.Buy,
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'خير زمان',
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
                              'hello in our shop app',
                              style: TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            // TextFormField(
                            //   controller: phoneController,
                            //
                            //   decoration: InputDecoration(
                            //     suffixIcon: Icon(Icons.phone_outlined,color: defaultColor,),
                            //     label: Text(
                            //       'phone',
                            //       style: TextStyle(
                            //         color: defaultColor,
                            //       ),
                            //     ),
                            //     hintText: '01*********',
                            //   ),
                            //   validator: (value)
                            //   {//||value.length!=11
                            //     if(value!.isEmpty)
                            //     {
                            //       return'not valid phone';
                            //     }
                            //
                            //   },
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: ShopLoginCubit.get(context).obscure,
                              decoration: InputDecoration(

                                suffixIcon: IconButton(
                                  onPressed: (){
                                    ShopLoginCubit.get(context).showPassword();
                                  },
                                  icon: Icon(Icons.remove_red_eye_rounded,
                                    color: defaultColor,),
                                ),
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
                                if(value!.isEmpty ||value!='123456')
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
                                        CacheHelper.saveData(key: 'login',value: true);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context)=>HomePage()));

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
