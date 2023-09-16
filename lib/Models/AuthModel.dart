class AuthModel{
    bool? status;
    String?  message;
    AuthData? data;

    AuthModel({this.data,this.status,this.message});
  AuthModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    message=json["message"];
    data=json["data"]!=null?AuthData.fromJson(json["data"]):null;

  }

}

class AuthData{
   late int?  id;
   late String? name;
   late   String? email;
   late   String? phone;
   late   String? image;
   late   int? points;
   late    int? credit;
   late   String? token;
AuthData({this.name,this.phone,this.email,this.token,this.image,this.id,this.credit,this.points});
  AuthData.fromJson(Map<String,dynamic>json){
    id=json["id"];
    name=json["name"];
    email=json["email"];
    phone=json["phone"];
    image=json["image"];
    points=json["points"];
    credit=json["credit"];
    token=json["token"];
  }
}