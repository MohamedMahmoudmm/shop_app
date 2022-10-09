import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khair_zaman/modules/khairzaman/login/login_screen.dart';
import 'package:khair_zaman/layout/prices/home_layout.dart';
import 'package:khair_zaman/shared/component/constants.dart';
import 'package:khair_zaman/shared/network/local/cache_helper.dart';
import 'package:khair_zaman/shared/network/remote/dio_helper.dart';


void main()async {
print('hii');
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   var token = await FirebaseMessaging.instance.getToken();
print(token);
  await CacheHelper.init();

  Widget widget;

  login=CacheHelper.getData(key: 'login');
  if(login != null)
  {
    //print(uId);
    //print('from main');
    widget= HomePage();
  }
  else
  {
    widget=ShopLoginScreen();
  }

  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {

  final Widget? startWidget;

  const MyApp({this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Colors.deepPurple,

        scaffoldBackgroundColor: Colors.white,
        appBarTheme:  AppBarTheme(
          elevation: 10.0,
          iconTheme: IconThemeData(color: defaultColor),


          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey,
            statusBarIconBrightness: Brightness.dark
          ),

          titleTextStyle: TextStyle(
            color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
          ),
          centerTitle: true,

          actionsIconTheme: IconThemeData(
            color: defaultColor,


          )
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: defaultColor,
          elevation: 20.0,

        )
      ),
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }}