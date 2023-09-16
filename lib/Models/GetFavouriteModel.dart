

class GetFavouriteModel{

  late bool status;
  late Data data;
  GetFavouriteModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    data=Data.fromJson(json["data"]);
  }
}


class Data{

  late dynamic current_page;
  List<ItemData>data=[];
  Data.fromJson(Map<String,dynamic>json){

    current_page=json["current_page"];
    json["data"].forEach((e){
      data.add(ItemData.frromJson(e));
    });
  }
}

class ItemData{

  late var id;
  late Product product;
  ItemData.frromJson(Map<String,dynamic>json){
    id=json["id"];
    product=Product.fromJson(json["product"]);
  }
}

class Product{

  late var id;
  var price;
  var oldPrice;
  var discount;
  late var image;
  late var name;
  late var description;
  Product.fromJson(Map<String,dynamic>json){
    id=json["id"];
    price=json["price"];
    oldPrice=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];

  }
}