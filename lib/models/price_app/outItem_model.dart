class OutItemsModel
{
  late String name;
  late String price;
  late String date;

  OutItemsModel({
    required this.price,
    required this.name,
    required this.date,

  });
  OutItemsModel.fromJson(Map<String,dynamic> json)
  {
    price=json['price'];
    name=json['name'];
    date=json['date'];

  }
  Map<String,dynamic> toMap(){
    return
      {
        'name':name,
        'price':price,
        'date':date,

      };
  }
}