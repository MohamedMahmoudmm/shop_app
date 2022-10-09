

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khair_zaman/layout/prices/cubit/cubit.dart';
import 'package:khair_zaman/layout/prices/cubit/states.dart';
import 'package:khair_zaman/models/price_app/customer_model.dart';
import 'package:khair_zaman/modules/khairzaman/out_money/customerAccount_screen.dart';

class OutMoney extends StatelessWidget {
  OutMoney({Key? key}) : super(key: key);
var customerName=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>PriceCubit()..getCustomer(),
      child: BlocConsumer<PriceCubit,PriceStates>(
        listener: (BuildContext context,PriceStates state){},
          builder: (BuildContext context,PriceStates state)
        {
          var cubit=PriceCubit.get(context);
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index)=>buildOutItem(context,cubit.listCustomer[index]),
                    separatorBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        color: Colors.grey[400],
                        height: 2,
                        width: double.infinity,
                      ),
                    ),
                    itemCount: cubit.listCustomer.length),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(cursorHeight: 25,
                  textAlign: TextAlign.end,
                  controller: customerName,
                  decoration: InputDecoration(

                      prefixIcon: IconButton(
                          onPressed: ()
                          {

                            cubit.addCustomer(name: customerName.text);
                          },
                          icon: Icon(Icons.add,color: Colors.blue[800],size: 28,)),
                      hintText: 'اضف عميل',
                      hintStyle: TextStyle(fontSize: 17),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.blue[800]!,
                        ),
                      )
                  ),
                ),
              )
            ],
          );
        },
          ),
    );
  }


  Widget buildOutItem(var context,CustomerModel model)=>InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountScreen(model)));
      PriceCubit.get(context).updateCustomer(model);

    },
    child: Padding(
      padding: const EdgeInsets.only(right: 18,left: 18,top: 10,bottom: 10),
      child: Row(
        children: [
          Text(model.totalAccount,style: TextStyle(color: Colors.blue[800],fontSize: 22,),),
          Spacer(),
          Text(model.name,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),
    ),
  );
}
