class HomeModel{

 late bool? Status;
 late DataModel? data;
 HomeModel({this.data,this.Status});
HomeModel.fromJson(Map<String,dynamic>json){
  Status=json["Status"];
  data=json["data"]!=null?DataModel.fromjson(json["data"]):null;
}
}

class DataModel{
  late List<BannerModel>?banners=[];
  late List<ProductModel>?products=[];
  DataModel.fromjson(Map<String,dynamic>json){
   json["banners"].forEach((element){
     banners!.add(BannerModel.fromJson(element));
   });
   json["products"].forEach((element){
     products!.add(ProductModel.fromJson(element));
   });
  }
}
class ProductModel{
  late var id;
  late var price;
  late  var old_price;
  late  var discount;
  late  String? image;
  late  String? name;
  late  String? description;
  late var in_favorites;
  late var in_cart;
   ProductModel({this.id,this.image,this.name,this.price,this.description,this.discount,this.in_cart,this.in_favorites,this.old_price});
  ProductModel.fromJson(Map<String,dynamic>json){
    id=json["id"];
    price=json["price"];
    old_price=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];
    in_favorites=json["in_favorites"];
    in_cart=json["in_cart"];
  }


}
class BannerModel{
  late  var id;
  late String? image;
   BannerModel({this.image,this.id});
  BannerModel.fromJson(Map<String,dynamic>json){
    id=json["id"];
    image=json["image"];
  }
}
