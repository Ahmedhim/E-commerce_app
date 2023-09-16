class AddCartModel{
  late bool status;
  late String message;
  AddCartData? data;
  AddCartModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    message=json["message"];
    data=AddCartData.fromJson(json["data"]);
  }
}

class AddCartData{
  late int id;
  late int quantity;
  AddCartProduct? product;
  AddCartData.fromJson(Map<String,dynamic>json){
    id=json["id"];
    quantity=json["quantity"];
    product=AddCartProduct.fromJson(json["product"]);
  }
}

class AddCartProduct{
  late int id;
  late var price;
  late var oldPrice;
  late var discount;
  late String image;
  late String name;
  late String desc;
  AddCartProduct.fromJson(Map<String,dynamic>json){
    id=json["id"];
    price=json["price"];
    oldPrice=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    desc=json["description"];
  }


}