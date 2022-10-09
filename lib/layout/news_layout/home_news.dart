import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/news_layout/cubit/cubit.dart';
import 'package:khair_zaman/layout/news_layout/cubit/states.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..getSports(),
      child: BlocConsumer<NewsCubit,NewsStates>(
          listener: (BuildContext context, NewsStates state){},
          builder: (BuildContext context,NewsStates state){
            var cubit= NewsCubit.get(context);
            return Scaffold(

              appBar: AppBar(
                title: Text("news app"),
                actions: [
                  IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.search)
                  )
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                  onTap:(index){ cubit.navBar(index);},
                  items: cubit.newsBottomItems),


              body: cubit.Screens[cubit.currentIndex]
              
            );
          }

      ),
    );
  }


}
