
class CategoryModel{

  late bool? status;
  late CategoryData? data;
  CategoryModel({this.data,this.status});
  CategoryModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    data=CategoryData.fromJson(json["data"]);
  }
}

class CategoryData{
  late int? currentPage;
  late List<CategoryDataDetails>?data=[];
  CategoryData({this.data,this.currentPage});
  CategoryData.fromJson(Map<String,dynamic>json){
    currentPage=json["current_page"];
    json["data"].forEach((element){
      data?.add(CategoryDataDetails.fromJson(element));
    });
  }
}

class CategoryDataDetails{

  late int? id;
  late String? name;
  late String? image;
  CategoryDataDetails({this.id,this.name,this.image});
  CategoryDataDetails.fromJson(Map<String,dynamic>json){
    id=json["id"];
    name=json["name"];
    image=json["image"];
  }
}