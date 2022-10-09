import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/news_layout/cubit/cubit.dart';
import 'package:khair_zaman/layout/news_layout/cubit/states.dart';


class SportsPage extends StatelessWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, NewsStates state){},
        builder: (BuildContext context, NewsStates state){
      var cubit= NewsCubit.get(context);
      return ListView.separated(itemBuilder: (context,index)=>BuildItem(cubit.sports[index]),
          separatorBuilder:(context,index)=> SizedBox(height: 2,),
          itemCount: cubit.business.length);
        },
        );
  }
  Widget BuildItem(Map model)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              image:DecorationImage(image: NetworkImage("${model['urlToImage']}"),
                  fit: BoxFit.cover)
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(

                    child: Text('${model['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,)
                ),
                Text('${model["publishedAt"]}')
              ],
            ),
          ),
        )
      ],
    ),
  );
}
