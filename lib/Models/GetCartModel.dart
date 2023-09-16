class GetCartModel{
  late bool status;
  GetCartData? data;
  GetCartModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    data=GetCartData.fromJson(json["data"]);
  }
}

class GetCartData{
  List<CartItems>carts=[];
  late var subTotal;
  late var total;
  GetCartData.fromJson(Map<String,dynamic>json){
    json["cart_items"].forEach((element){
      carts.add(CartItems.fromJson(element));
    });
    subTotal=json["sub_total"];
    total=json["total"];
  }
}

class CartItems{

  late var id;
  late var quantity;
  GetCartProduct? product;
  CartItems.fromJson(Map<String,dynamic>json){
    id=json["id"];
    quantity=json["quantity"];
    product=GetCartProduct.fromJson(json["product"]);
  }

}
class GetCartProduct{
  late var id;
  late var price;
  late var oldPrice;
  late var discount;
  late String image;
  late String name;
  late String desc;
  List<String>images=[];
  late bool inFavourite;
  late bool inCart;
  GetCartProduct.fromJson(Map<String,dynamic>json){
    id=json["id"];
    price=json["price"];
    oldPrice=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    desc=json["description"];
    json["images"].forEach((element){
      images.add(element);
      inFavourite=json["in_favorites"];
      inCart=json["in_cart"];

    });

  }

}