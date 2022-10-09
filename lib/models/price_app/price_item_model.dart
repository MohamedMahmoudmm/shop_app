class priceItemModel
{
  late String name;
  late String price;
   late String image;
  late String uId;
  late String category;



  priceItemModel({
    required this.price,
    required this.name,
    required this.image,
    required this.uId,
    required this.category,


  });
  priceItemModel.fromJson(Map<String,dynamic> json)
  {
    price=json['price'];
    name=json['name'];
    image=json['image'];
    uId=json['uId'];
    category=json['category'];



  }
  Map<String,dynamic> toMap(){
    return
      {
        'name':name,
        'price':price,
        'image':image,
        'uId':uId,
        'category':category,


      };
  }
}