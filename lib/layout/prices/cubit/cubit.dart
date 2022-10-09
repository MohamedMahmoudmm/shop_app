import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khair_zaman/layout/prices/cubit/states.dart';
import 'package:khair_zaman/models/price_app/customer_model.dart';
import 'package:khair_zaman/models/price_app/outItem_model.dart';
import 'package:khair_zaman/models/price_app/price_item_model.dart';
import 'package:khair_zaman/modules/khairzaman/list_price/finallist_price.dart';
import 'package:khair_zaman/modules/khairzaman/out_money/out.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class PriceCubit extends Cubit<PriceStates>
{
  PriceCubit(): super(PriceInitialState());
  static PriceCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  int newsCurrentIndex=0;


  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(icon: Icon(Icons.menu),
    label: 'الاسعار'),
    BottomNavigationBarItem(icon: Icon(Icons.monetization_on),
    label: 'الخارج'),
  ];

  List<Widget> screens=[
    FinalList(),
    OutMoney()
  ];
  List<String> titles=
      [
        'قائمة الأسعار',
        'الخارج'
      ];

  void changeBottomNavBar(int index){
    currentIndex=index;
    emit(PriceBottomNavState());
  }

  void createItem(
  {
    required String name,
    required String price,
})
  {
    priceItemModel model=priceItemModel(
        price: price,
        name: name,
        image: 'https://i.pinimg.com/originals/4b/a7/d8/4ba7d8d3c62e961494a50de2f61b2cc8.jpg',
        uId: '',
        category: '');
    FirebaseFirestore.instance
    .collection('items')
    .add(model.toMap()).then((value)
    {
      model.uId=value.id;
      updateItem(model);
      emit(CreateItemSuccessState());

    }).catchError((error){
      emit(CreateItemErrorState());
    });
  }
  priceItemModel? model;
  List<priceItemModel> listItem=[];
 //List<priceItemModel> listOfSpices=[];
  //List<priceItemModel> listOfCleaner=[];
  //List<priceItemModel> listOfGrocery=[];
  //List<priceItemModel> listOfTotal=[];



  void getItemData()
  {
    //emit(GetItemSuccessState());
    //priceItemModel? model;
    listItem=[];
    print('1110');
    FirebaseFirestore.instance
        .collection('items')
        .get()
        .then((value) {
          value.docs.forEach((element) {
           // print(element.data());
            listItem.add(priceItemModel.fromJson(element.data()));
            //print('1');
          });
          print('555${listItem.length}');
          emit(GetItemSuccessState());
    }).catchError((error){
      print('0000'+error.toString());
      emit(GetItemErrorState());
    });

  }
  File? itemImage;
  var picker=ImagePicker();

  Future<void> getItemImage(priceItemModel model)async
  {
    final pickedFile=await picker.pickImage(source:ImageSource.gallery,
    );
    if (pickedFile !=null)
      {
        itemImage=File(pickedFile.path);
        emit(GetItemImageSuccessState());
        print(itemImage!.path);
        uploadItemImage(model);
      }
    else
      {
        print('no image selected');
        emit(GetItemImageErrorState());
      }
  }

  String? itemImageUrl='';
  void uploadItemImage(priceItemModel model)async
  {
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('items/${Uri.file(itemImage!.path).pathSegments.last}')
        .putFile(itemImage!)
        .then((value)async  {
          print(value);
       await value.ref.getDownloadURL()
          .then((value)
      {

        emit(UploadItemImageSuccessState());
        itemImageUrl=value;

print('hiiiii');
        updateItem(model);
        print('link$itemImageUrl');

      }).catchError((error)
      {
        print('777777777777:$error');
        emit(UploadItemImageErrorState());
      });
    }).catchError((error) {
      print('8888888888:$error');
      emit(UploadItemImageErrorState());
    });
  }

  void updateItem(priceItemModel model)
  {
    priceItemModel updateModel = priceItemModel(
        price: model.price,
        name: model.name,
        image: itemImageUrl!,
        uId:model.uId,
        category: '');

    FirebaseFirestore.instance
        .collection('items').doc(updateModel.uId)
        .update(updateModel.toMap())
        .then((value)
    {

      getItemData();
      print(updateModel.image);
    }).catchError((error)
    {
      print('error:$error');
      emit(UpdateItemImageErrorState());
    });
  }
  void updatePrice({required priceItemModel model,required String price})
  {

      priceItemModel updateModel = priceItemModel(
          price: price,
          name: model.name,
          image: model.image,
          uId:model.uId,
          category: '');

      FirebaseFirestore.instance
          .collection('items').doc(updateModel.uId)
          .update(updateModel.toMap())
          .then((value)
      {
        getItemData();
        //print(updateModel.image);
      }).catchError((error)
      {
        print('error:$error');
        emit(UpdateItemPriceErrorState());
      });
    }
void addCustomer({required String name})
{
  CustomerModel customer=CustomerModel(
      totalAccount: '0',
      name: name,
      uId: '');
FirebaseFirestore.instance
    .collection('customer')
    .add(customer.toMap())
  .then((value)
{
  customer.uId=value.id;
  updateCustomer(customer);
  emit(CreateCustomerSuccessState());

}).catchError((error)
{
  emit(CreateCustomerErrorState());
});
}
  void updateCustomer(CustomerModel model)
  {print(model.name);
    //addCustomerItem(customerId: customerId, text: text, date: date, price: price)
String total= totalAccount(model);
    CustomerModel updateModel = CustomerModel(
        totalAccount:total ,
        name: model.name,
        uId: model.uId);

    FirebaseFirestore.instance
        .collection('customer')
        .doc(updateModel.uId)
        .update(updateModel.toMap())
        .then((value)
    {

      getCustomer();
    }).catchError((error)
    {
      print('error:$error');
      emit(UpdateCustomerErrorState());
    });
  }
  List<CustomerModel> listCustomer=[];
  void getCustomer()
  {
    //emit(GetItemSuccessState());
    //priceItemModel? model;
    listCustomer=[];

    FirebaseFirestore.instance
        .collection('customer')//.orderBy(model!.name,descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        listCustomer.add(CustomerModel.fromJson(element.data()));
      });
      emit(GetCustomerSuccessState());
    }).catchError((error){
      emit(GetCustomerErrorState());
    });

  }

  void addCustomerItem({
    required String customerId,
    required String text,
    required String date,
    required String price,

  }) {
    OutItemsModel outItem =OutItemsModel(
        price: price,
        name: text,
        date: date);

    FirebaseFirestore.instance
        .collection('customer')
        .doc(customerId)
        .collection('account')
        .add(outItem.toMap())
        .then((value) {
          //updateCustomer(model);
      emit(AddItemToCustomerSuccessState());
    }).catchError((error) {
      emit(AddItemToCustomerErrorState());
    });
  }
  List<OutItemsModel> customerItems = [];

  void getCustomerItems({required String customerId}) {
    print(customerId);
    FirebaseFirestore.instance
        .collection('customer')
        .doc(customerId)
        .collection('account')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      customerItems = [];

      event.docs.forEach((element) {
         customerItems.add(OutItemsModel.fromJson(element.data()));
      });

      //getLastMessage(receiverId: receiverId);
      //print('222');
      //lastMessages=messages[messages.length-1].text;
      //print(lastMessages[]);
      emit(GetItemToCustomerSuccessState());
    });
  }
  String totalAccount(CustomerModel model)
  {//customerItems = [];
    int total=0;

    getCustomerItems(customerId: model.uId);
    //getCustomerItems(customerId: model.uId);

    print("$customerItems +inside total");

    if(customerItems.isNotEmpty)
    {

  for(int i=0;i<customerItems.length;i++)
    {
      total+=int.parse(customerItems[i].price);
    }
      return total.toString();

    }
    //customerItems.add(OutItemsModel.fromJson(element.data()));
    return total.toString();

  }

  List<priceItemModel> searchListItem=[];

  void searchItemData({required String text})
  {
    //emit(GetItemSuccessState());
    //priceItemModel? model;
    searchListItem=[];

     FirebaseFirestore.instance
        .collection('items')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if(priceItemModel.fromJson(element.data()).name.contains(text)) {
          searchListItem.add(priceItemModel.fromJson(element.data()));
        }
      });
      emit(GetItemSuccessState());
    }).catchError((error){
      emit(GetItemErrorState());
    });

  }

  void deleteItem({required priceItemModel model})
  {
    FirebaseFirestore.instance
        .collection('items')
        .doc(model.uId)
        .delete().then((value)
    {
      emit(DeleteItemSuccessState());
      getItemData();
    }).catchError((error)
    {
      emit(DeleteItemErrorState());
    });
  }
}