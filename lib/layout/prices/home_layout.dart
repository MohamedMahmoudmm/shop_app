import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khair_zaman/layout/prices/cubit/cubit.dart';
import 'package:khair_zaman/layout/prices/cubit/states.dart';
import 'package:khair_zaman/modules/khairzaman/search/search_screen.dart';
import 'package:khair_zaman/shared/component/constants.dart';
//import 'package:url_launcher/url_launcher.dart';



class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);



   final GlobalKey<FormState> formkey=GlobalKey<FormState>();

  final TextEditingController priceController=TextEditingController();
  final TextEditingController typeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>PriceCubit()..getItemData(),
      child: BlocConsumer<PriceCubit,PriceStates>(
        listener: (BuildContext context,PriceStates state){},
        builder: (BuildContext context,PriceStates state){
          var cubit= PriceCubit.get(context);
          return Scaffold(

            appBar: AppBar(
              elevation: 2,
              leading: TextButton(onPressed: (){
                showDialog(context: context, builder: (context){
                  return SingleChildScrollView(
                    child: AlertDialog(
                      //title: Text('ادخل الصنف'),
                      content: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, icon: const Icon(Icons.close,color: Colors.red,size: 25,)),
                            ),
                            TextFormField(
                              textAlign: TextAlign.right,
                              controller: typeController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'ادخل الصنف';
                                }
                                return null;
                              },
                              decoration:  InputDecoration(

                                //labelText: 'الصنف',
                                  labelText: 'الصنف',
                                  labelStyle: TextStyle(color: defaultColor)

                              ),
                            ),
                            TextFormField(
                              textAlign: TextAlign.right,
                              controller: priceController,
                              cursorWidth: 1,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'ادخل السعر';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              // maxLength: 6,
                              decoration: InputDecoration(
                                  labelText: 'السعر',
                                  labelStyle: TextStyle(color: defaultColor)
                              ),

                            ),

                            IconButton(onPressed: (){
                              if(formkey.currentState!.validate()) {
                                cubit.createItem(name:typeController.text , price: priceController.text, );
                                cubit.getItemData();
                                typeController.text='';
                                priceController.text='';
                                //FocusScope.of(context).requestFocus(FocusNode());


                                Fluttertoast.showToast(
                                    msg: "تم الاضافه",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 18.0
                                );
                              }


                            }, icon: const Icon(Icons.add),
                            color: defaultColor,)

                          ],
                        ),
                      ) ,
                    ),
                  );
                }
                );

              },
                child: Text("اضافه",style: TextStyle(color: defaultColor,fontWeight: FontWeight.bold),),

              ),
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(onPressed: ()async{
                  // const uri =
                  //     'mailto:test@example.org?subject=Greetings&body=Hello%20World';
                  // if ( await canLaunch(uri)) {
                  //  await launch(uri);
                  // } else
                  // {
                  // throw 'Could not launch $uri';
                  // }
                }, icon: const Icon(Icons.notifications)),
                IconButton(onPressed: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                }, icon: const Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
