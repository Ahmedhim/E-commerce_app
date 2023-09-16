class SearchModel{

  late bool status;
  late Data data;
  SearchModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    data=Data.fromJson(json["data"]);
  }
}
class Data{
  late int  CurrentPage;
  late List<DeepData>datalist=[];
  Data.fromJson(Map<String,dynamic>json){
    CurrentPage=json["current_page"];
    json["data"].forEach((e){
      datalist.add(DeepData.fromJson(e));
    });
  }
}
class DeepData{
  late int id;
  late dynamic price;
  late String image;
  late String name;
  late String description;
  late List images=[];
  late bool inFavourite;
  late bool inCart;
  DeepData.fromJson(Map<String,dynamic>json){
    id=json["id"];
    price=json["price"];
    image=json["image"];
    name=json["name"];
    description=json["description"];
    json["images"].forEach((e){
      images.add(e);
    });
    inFavourite=json["in_favorites"];
    inCart=json["in_cart"];
  }
}