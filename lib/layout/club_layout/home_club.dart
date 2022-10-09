import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/club_layout/cubit/cubit.dart';
import 'package:khair_zaman/layout/club_layout/cubit/states.dart';

class HomeClub extends StatelessWidget {
  const HomeClub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ClubCubit(),
      child: BlocConsumer<ClubCubit,ClubStates>(
        listener: (BuildContext context, ClubStates state){},
    builder: (BuildContext context,ClubStates state){
    var cubit= ClubCubit.get(context);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ترتيب الهدافين',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red[900]
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text('عدد الاهداف',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]
                      ),),
                    Spacer(),
                    Text(
                      'الاسم',
                      style: TextStyle(
                          fontSize:20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text('10',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                    Spacer(),
                    Text(
                      'محمد محمود',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red[900]
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(cubit.title[cubit.currentIndex]),
          actions: [
            IconButton(
              onPressed: (){},
                icon:Icon(Icons.notifications_active))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items:cubit.Items,
          currentIndex: cubit.currentIndex,
          onTap: (index)
          {
            cubit.changeNavBar(index);
          },

        ),
        body: cubit.screen[cubit.currentIndex]
      ),
    );
    }
    ));
  }
}
