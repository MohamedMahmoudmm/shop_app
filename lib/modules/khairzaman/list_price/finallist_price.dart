
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khair_zaman/layout/prices/cubit/cubit.dart';
import 'package:khair_zaman/layout/prices/cubit/states.dart';
import 'package:khair_zaman/models/price_app/price_item_model.dart';
import 'package:khair_zaman/shared/component/constants.dart';


class FinalList extends StatelessWidget {
   FinalList({Key? key}) : super(key: key);

   GlobalKey<FormState> newPriceformkey=GlobalKey<FormState>();
  var newPriceController=TextEditingController();
  //TabController? myController;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PriceCubit,PriceStates>(
      listener: (BuildContext context,PriceStates state){

      },
      builder: (BuildContext context,PriceStates state) {
        var cubit= PriceCubit.get(context);
        print(cubit.listItem.length);
       // var list =cubit.listItem;
        return Stack(
          children: [


            ConditionalBuilder(
                condition: cubit.listItem.isNotEmpty,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildPriceItems(cubit.listItem[index],context),
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                      ),
                      itemCount: cubit.listItem.length),
                ),
                fallback: (context)=>const Center(
                  child: CircularProgressIndicator(),)
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: ()
                        {
                          //list =cubit.listItem;
                        },
                        child: Container(
                          // width: 50,
                          //height: 30,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,),
                            child: Text('الكل',style: TextStyle(fontSize: 22),),
                          ),),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()
                        {
                         // list =cubit.listOfGrocery;

                        },
                        child: Container(
                          // width: 50,
                          //height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,),
                            child: Text('بقاله',style: TextStyle(fontSize: 22),),
                          ),),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()
                        {
                          //list =cubit.listOfSpices;
                        },
                        child: Container(
                         // width: 50,
                          //height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,),
                            child: Text('توابل',style: TextStyle(fontSize: 22),),
                          ),),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()
                        {
                          //list =cubit.listOfCleaner;
                        },
                        child: Container(
                          // width: 50,
                          //height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,),
                            child: Text('منظفات',style: TextStyle(fontSize: 22),),
                          ),),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        // width: 50,
                        //height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black87)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,),
                          child: Text('الفل',style: TextStyle(fontSize: 22),),
                        ),),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()
                        {
                          //list =cubit.listOfTotal;
                        },
                        child: Container(
                          // width: 50,
                          //height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,),
                            child: Text('جمله',style: TextStyle(fontSize: 22),),
                          ),),
                      ),

                    ],
                  ),
                ),
              ),
            ),

          ],
        );
      }
    );




  }
  Widget buildPriceItems(priceItemModel model,context) => Dismissible(
    key: Key(model.uId),
    onDismissed: (direction)
    {
    showDialog(context: context, builder: (context1){
    return AlertDialog(
    content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(model.name),
            const SizedBox(height: 20,),
            Container(
                color: Colors.red,
                child: TextButton(
                    onPressed: ()
                    {
                      Navigator.pop(context);

                      PriceCubit.get(context).deleteItem(model: model);
                      Fluttertoast.showToast(
                          msg: " تم الحذف بنجاح",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 18.0
                      );

                    },
                child: Text('حذف',style: TextStyle(color: Colors.white,fontSize: 18),))),
          ],
        )
    );
    });
    },
    child: Padding(
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
                    showDialog(context: context, builder: (context1){
                      return AlertDialog(
                        content: Form(
                          key: newPriceformkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: newPriceController,
                                cursorWidth: 1,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'ادخل السعر';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'السعر',
                                    labelStyle: TextStyle(color: defaultColor)
                                ),
                              ),

                              IconButton(onPressed: (){
                                if(newPriceformkey.currentState!.validate()) {
                                PriceCubit.get(context)
                                    .updatePrice(
                                    model:model,
                                    price: newPriceController.text);
                                newPriceController.text='';
                                Navigator.pop(context);

                                Fluttertoast.showToast(
                                    msg: " تم تغير السعر بنجاح",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 18.0
                                );
                              }
                                }, icon: Icon(Icons.add))
                            ],
                          ),
                        ),
                      );
                    });
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

                      PriceCubit.get(context).getItemImage(model);

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


    ),
  );
}
