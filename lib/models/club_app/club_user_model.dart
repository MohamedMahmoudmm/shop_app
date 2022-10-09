class ClubUserModel
{
   late String name;
   late String email;
   late String phone;
   late String uId;

   ClubUserModel({
     required this.email,
     required this.name,
     required this.phone,
     required this.uId,
});
   ClubUserModel.fromJson(Map<String,dynamic> json)
   {
     email=json['email'];
     name=json['name'];
     phone=json['phone'];
     uId=json['uId'];

   }
   Map<String,dynamic> toMap(){
     return
         {
           'name':name,
           'email':email,
           'phone':phone,
           'uId':uId,
         };
   }
}