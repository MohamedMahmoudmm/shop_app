import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/prices/cubit/cubit.dart';
import 'package:khair_zaman/layout/prices/cubit/states.dart';
import 'package:khair_zaman/models/price_app/customer_model.dart';
import 'package:khair_zaman/models/price_app/outItem_model.dart';
import 'package:khair_zaman/shared/component/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class AccountScreen extends StatelessWidget {
  //const AccountScreen({Key? key}) : super(key: key);
   late CustomerModel myModel;

   AccountScreen(CustomerModel myModel){
  this.myModel=myModel;
}
   GlobalKey<FormState> formKey=GlobalKey<FormState>();

   var priceItemController=TextEditingController();
   var nameItemController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>PriceCubit()..getCustomerItems(customerId: myModel.uId),
   child:BlocConsumer<PriceCubit,PriceStates>(
     listener: (context,state){},
       builder:(context,state)
       {
         var cubit=PriceCubit.get(context);
         return  Scaffold(
           appBar: AppBar(
             title: Text(myModel.name),

           ),
           floatingActionButton: FloatingActionButton(backgroundColor: Colors.blue[800],
             onPressed: ()
             {showDialog(context: context, builder: (context){
               return SingleChildScrollView(
                 child: AlertDialog(
                   //title: Text('ادخل الصنف'),
                   content: Form(
                     key: formKey,
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         TextFormField(
                           controller: nameItemController,
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
                           controller: priceItemController,
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
                           if(formKey.currentState!.validate()) {
                             cubit.addCustomerItem(
                                 customerId: myModel.uId,
                                 text: nameItemController.text,
                                 date: DateTime.now().toString(),
                                 price: priceItemController.text);
                             cubit.updateCustomer(myModel);
                           }


                         }, icon: Icon(Icons.check),
                           color: defaultColor,)

                       ],
                     ),
                   ) ,
                 ),
               );
             }
             );


             },
             child: Icon(Icons.add),),
           body:ConditionalBuilder(
               condition: cubit.customerItems.length>0,
               builder:(BuildContext context)=> ListView.separated(
                   itemBuilder: (context,index)=>buildAccountItem(cubit.customerItems[index]),
                   separatorBuilder:(context,index)=>Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: Container(
                       height: 1.5,
                       color: Colors.grey,
                       width: double.infinity,),
                   ),
                   itemCount: cubit.customerItems.length
               ),
               fallback: (BuildContext context)=>Center(child: Text('no item yet'),)),
         );
       },
      )
      , );
  }


  Widget buildAccountItem(OutItemsModel model)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Row(
        children: [
          Text(model.price ,style: TextStyle(color: Colors.blue[800],fontSize: 20),),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(model.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(model.date,style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
