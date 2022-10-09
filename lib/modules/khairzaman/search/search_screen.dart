import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/prices/cubit/cubit.dart';
import 'package:khair_zaman/layout/prices/cubit/states.dart';
import 'package:khair_zaman/models/price_app/price_item_model.dart';
import 'package:khair_zaman/shared/component/constants.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> newPriceformkey=GlobalKey<FormState>();
  var newPriceController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>PriceCubit()..getItemData(),
      child: BlocConsumer<PriceCubit,PriceStates>(
          listener: (BuildContext context,PriceStates state){

          },
          builder: (BuildContext context,PriceStates state) {
            var cubit= PriceCubit.get(context);
            return Scaffold(
              appBar: AppBar(title: TextFormField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: 'البحث',
                  prefixIcon: Icon(Icons.search)

                ),
                onChanged: (value)
                {
                  //Future.delayed(const Duration(milliseconds: 500));
                  cubit.searchItemData(text: value);
                },
              ),),
              body:ConditionalBuilder(
                  condition: cubit.searchListItem.isNotEmpty,
                  builder:  (context)=>ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildPriceItems(cubit.searchListItem[index],context),
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                      ),
                      itemCount: cubit.searchListItem.length),
                  fallback: (context)=>Center(child: CircularProgressIndicator())),
            );
          }
      ),
    );
  }

  Widget buildPriceItems(priceItemModel model,context) => Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      width: double.infinity,
      height: 100,

      child: Row(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(

                  '${model.name}',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                ),
                SizedBox(
                  height:8,
                ),
                TextButton(
                  onPressed: ()
                  {
                    // showDialog(context: context, builder: (context1){
                    //   return AlertDialog(
                    //     content: Form(
                    //       key: newPriceformkey,
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           TextFormField(
                    //             controller: newPriceController,
                    //             cursorWidth: 1,
                    //             validator: (value){
                    //               if(value!.isEmpty){
                    //                 return 'ادخل السعر';
                    //               }
                    //               return null;
                    //             },
                    //             keyboardType: TextInputType.number,
                    //             decoration: InputDecoration(
                    //                 labelText: 'السعر',
                    //                 labelStyle: TextStyle(color: defaultColor)
                    //             ),
                    //           ),
                    //
                    //           IconButton(onPressed: (){
                    //             if(newPriceformkey.currentState!.validate()) {
                    //               PriceCubit.get(context)
                    //                   .updatePrice(
                    //                   model:model,
                    //                   price: newPriceController.text);
                    //               //PriceCubit.get(context).ge
                    //               newPriceController.text='';
                    //
                    //               Fluttertoast.showToast(
                    //                   msg: " بنجاح${model.name}تم تغير السعر ",
                    //                   toastLength: Toast.LENGTH_SHORT,
                    //                   gravity: ToastGravity.CENTER,
                    //                   timeInSecForIosWeb: 1,
                    //                   backgroundColor: Colors.green,
                    //                   textColor: Colors.white,
                    //                   fontSize: 18.0
                    //               );
                    //             }
                    //           }, icon: Icon(Icons.add))
                    //         ],
                    //       ),
                    //     ),
                    //   );
                    // });
                  },
                  child: Text(
                    '${model.price}',
                    style: TextStyle(fontSize: 20,color: defaultColor),
                  ),
                ),
              ]),
          SizedBox(width: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 85,
                height: 85,
                //color: Colors.grey[200],
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    image: DecorationImage(
                      // FileImage(PriceCubit.get(context).itemImage) as ImageProvider
                        image:model.image == ''? NetworkImage('https://i.pinimg.com/originals/4b/a7/d8/4ba7d8d3c62e961494a50de2f61b2cc8.jpg'):NetworkImage(model.image),

                        fit: BoxFit.cover
                    )
                ),
                child:MaterialButton(
                  onPressed: (){


                  },
                  //icon: Icon(Icons.camera_alt_outlined),
                )


            ),
          )
        ],
      ),
    ),


    // Container(
    //   height: double.infinity,
    //   width: 10,
    //
    //   decoration: BoxDecoration(
    //       color: Colors.blue,
    //       borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10))
    // ))


  );
}

