
import 'package:ecommerce_app/Api/Api.dart';
import 'package:ecommerce_app/Bloc/Auth/AuthState.dart';
import 'package:ecommerce_app/Models/AuthModel.dart';
import 'package:ecommerce_app/Screens/LoginScrenn.dart';
import 'package:ecommerce_app/SharedPref/SharedPref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthCubit extends Cubit<AuthState>{

  AuthCubit():super(initialAuthState());

void LoginWithEmail(String email,String password){
emit(LoadingLoginState());
FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
    password: password).then((value) {
      emit(SuccessLoginState());
})
    .catchError((error){
      print(error.toString());
      emit(ErrorLoginState());
});
}
  AuthModel? authModel;
void Login({required String email,required String password }){
  emit(LoadingLoginState());
  Api().post(url: "https://student.valuxapps.com/api/login",
      body: {
        "email":email,
        "password":password,
      }).then((value) async{
    authModel=AuthModel.fromJson(value);
    bool status;
    status=authModel!.status!;
    if(status==true){
     await Preference.saveData(key: "token", value: authModel!.data!.token);
      print(Preference.getData(key: "token"));
      Fluttertoast.showToast(
        msg: authModel!.message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      emit(SuccessLoginApiState());
    }
    else{
      Fluttertoast.showToast(
        msg: authModel!.message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      emit(ErrorLoginApiState());
    }

  })
      .catchError((error){
    print(error.toString());
    emit(ErrorLoginApiState());
  });
}

void RegisterWithEmail({
  required String email,
  required String password,
  required String name,
  required String phone,
  }){
  emit(LoadingRegisterState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
      password: password).then((value) {
        Reg(email: email,password: password,phone: phone,name: name);
        emit(SuccessRegisterState());
  }).
  catchError((error){
    print(error.toString());
    emit(ErrorRegisterState());
  });
  print(Preference.getData(key: "token"));
}

void Reg({required String name,required String phone,required String email,required String password,}){
emit(LoadingRegisterState());
  Api().post(url: "https://student.valuxapps.com/api/register",
    body:{"name":name,
      "phone":phone,
      "email":email,
      "password":password,
      "image":"https://tse1.mm.bing.net/th?id=OIP._pFDNQ2NiStB0jRNvwhsvQHaHk&pid=Api&rs=1&c=1&qlt=95&w=111&h=114",
    } ,
  ).then((value) async{
    bool status;
    authModel=AuthModel.fromJson(value);
    status=authModel!.status!;
    print(status);
    if(status==true){
      await Preference.saveData(key: "token", value:  authModel!.data!.token);
      print(Preference.getData(key: "token"));
      Fluttertoast.showToast(
        msg: authModel!.message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      emit(SuccessRegisterApiState());
    }
    else{
      Fluttertoast.showToast(
        msg: authModel!.message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      emit(ErrorRegisterApiState());
    }
  })
      .catchError((error){
    print(error.toString());
    emit(ErrorRegisterApiState());
  });
}
void Logout(context){
  emit(LoadingLogoutApiState());
  Api().post(url: "https://student.valuxapps.com/api/logout",
      body: {
        "fcm_token":"SomeFcmToken"
      },
      token: Preference.getData(key: "token")).
  then((value) {
    Preference.sharedPreferences!.remove("token").then((value) {
      Navigator.pushNamed(context, const LoginScreen().id);
      Fluttertoast.showToast(
        msg: "Logout Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      emit(SuccessLogoutApiState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorLogoutApiState());
    });
  }).catchError((error){
    print(error.toString());
    emit(ErrorLogoutApiState());
  });
}
AuthModel? profileModel;
void GetProfile(){
  emit(GetProfileLoadingState());
  Api().get(url: "https://student.valuxapps.com/api/profile",
      token: Preference.getData(key: "token"),
      headers: {
    "Authorization":Preference.getData(key: "token").toString(),
      }).then((value) {
        profileModel=AuthModel.fromJson(value);
        emit(GetProfileSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(GetProfileErrorState());
  });
}

@override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}