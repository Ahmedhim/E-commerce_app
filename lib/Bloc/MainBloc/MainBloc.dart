import 'package:ecommerce_app/Api/Api.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:ecommerce_app/Models/AddCartModel.dart';
import 'package:ecommerce_app/Models/AddFavouriteModel.dart';
import 'package:ecommerce_app/Models/GetCartModel.dart';
import 'package:ecommerce_app/Models/GetFavouriteModel.dart';
import 'package:ecommerce_app/Models/HomeModel.dart';
import 'package:ecommerce_app/Models/SearchModel.dart';
import 'package:ecommerce_app/Screens/CartScreen.dart';
import 'package:ecommerce_app/Screens/FavouriteScreen.dart';
import 'package:ecommerce_app/Screens/FeedScreen.dart';
import 'package:ecommerce_app/SharedPref/SharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Models/CategoryModel.dart';

class MainCubit extends Cubit<MainState>{

  MainCubit():super(initialMainState());

  int currentIndex=0;

  List<Widget>screens=const[
FeedScreen(),
    FavouriteScreen(),
    CartScreen(),
  ];
  List<String>Titles=const[
   "Store",
    "Favourites",
    "Cart",
  ];
  void ChangeBottomNavag(int index){
currentIndex=index;
emit(BottomNavState());
  }
  
  
  HomeModel? model;
  Map<int,bool>Favourites={};
  void GetProduct(){
    emit(GetProductLoadingState());
    Api().get(url: "https://student.valuxapps.com/api/home",
        headers: {
      "Authorization":Preference.getData(key: "token").toString(),
        },token: Preference.getData(key: "token"),
    ).then((value) {
      model=HomeModel.fromJson(value);
      model!.data!.products!.forEach((element) {
        Favourites.addAll({
          element.id:element.in_favorites
        });
      });
      print(Favourites);
      emit(GetProductSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(GetProductErrorState());
    });
    
  }
  CategoryModel? categoryModel;
  void GetCategory(){
    emit(GetCategoryLoadingState());
    Api().get(url: "https://student.valuxapps.com/api/categories",
        token: Preference.getData(key: "token"),
    headers: {
      "lang":"en"
    }
    ).then((value) {
      categoryModel=CategoryModel.fromJson(value);
      emit(GetCategorySuccessState());
    }).
    catchError((error){
      print(error.toString());
      emit(GetCategoryErrorState());
    });
  }
GetFavouriteModel? favouriteModel;
void GetFavourite(){
    emit(GetFavouriteLoadingState());
    Api().get(url: "https://student.valuxapps.com/api/favorites",
        token: Preference.getData(key: "token"),
        headers: {
      "Authorization":Preference.getData(key: "token").toString(),
        })
        .then((value) {
          favouriteModel=GetFavouriteModel.fromJson(value);
          emit(GetFavouriteSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(GetFavouriteErrorState());
    });
}
AddFavouriteModel? addFavouriteModel;
void AddFavourite({required var id}){

  Api().post(url: "https://student.valuxapps.com/api/favorites",
      body: {
        "product_id":id
      },
      token: Preference.getData(key: "token")).then((value) {
        addFavouriteModel=AddFavouriteModel.fromJson(value);
        var status;
        var message;
        message=addFavouriteModel!.message;
        status=addFavouriteModel!.status;
        if(status==true){
          Fluttertoast.showToast(
            msg: message.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          GetFavourite();
          emit(AddFavouriteSuccessState());
        }else{
          Fluttertoast.showToast(
            msg: message.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          emit(AddFavouriteErrorState());
        }
  })
      .catchError((error){
        print(error.toString());
        emit(AddFavouriteErrorState());
  });
}
SearchModel? searchModel;
void Search({required String text}){
  emit(SearchLoadingState());
  Api().post(url: "https://student.valuxapps.com/api/products/search",
      body: {
        "text":text
      },
      token: Preference.getData(key: "token")).
  then((value) {
    searchModel=SearchModel.fromJson(value);
    var status;
    status=searchModel!.status;
    if(status==true){
    emit(SearchSuccessState());}
    else if( status!=true){
      emit(SearchErrorState());
    }
  }).
  catchError((error){
    print(error.toString());
    emit(SearchErrorState());
  });
}
AddCartModel? addCartModel;
void AddCart({required var id}){

  Api().post(url: "https://student.valuxapps.com/api/carts",
      body: {
        "product_id":id
      },
      token: Preference.getData(key: "token")).
  then((value) {
    addCartModel=AddCartModel.fromJson(value);
    var status;
    var message;
    status=addCartModel!.status;
    message=addCartModel!.message;
    if(status==true){
      Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      GetCart();
      emit(AddCartSuccessState());
    }else{
      Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      emit(AddFCartErrorState());
    }

  }).catchError((error){
    print(error.toString());
    emit(AddFCartErrorState());
  });
}
GetCartModel? getCartModel;
void GetCart(){
  emit(GetCartLoadingState());
  Api().get(url: "https://student.valuxapps.com/api/carts",
      token: Preference.getData(key: "token"),
      headers: {
        "Authorization":Preference.getData(key: "token").toString(),
      }).then((value) {
getCartModel=GetCartModel.fromJson(value);
emit(GetCartSuccessState());

  })
      .catchError((error){
        print(error.toString());
        emit(GetCartErrorState());
  });
}




  @override
  void onChange(Change<MainState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}