class CustomerModel
{
  late String name;
  late String totalAccount;
  late String uId;

  CustomerModel({
    required this.totalAccount,
    required this.name,
    required this.uId,

  });
  CustomerModel.fromJson(Map<String,dynamic> json)
  {
    totalAccount=json['totalAccount'];
    name=json['name'];
    uId=json['uId'];

  }
  Map<String,dynamic> toMap(){
    return
      {
        'name':name,
        'totalAccount':totalAccount,
        'uId':uId,

      };
  }
}