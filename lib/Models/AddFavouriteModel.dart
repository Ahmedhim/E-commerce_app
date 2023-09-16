

class AddFavouriteModel{
  late bool status;
  late String message;
  Data? data;
  AddFavouriteModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    message=json["message"];
    data=Data.fromJson(json["data"]);
  }
}

class Data{
  var id;
  AddFavouriteProduct? product;
  Data.fromJson(Map<String,dynamic>json){
    id=json["id"];
    product=AddFavouriteProduct.fromJson(json["product"]);
  }
}

class AddFavouriteProduct{
  var id;
  var price;
  var oldPrice;
  var discount;
 late String image;
  AddFavouriteProduct.fromJson(Map<String,dynamic>json){
    id=json["id"];
    price=json["price"];
    oldPrice=json["old_price"];
    discount=json["discount"];
    image=json["image"];
  }
}