import 'package:ecommerce_app/Bloc/Auth/AuthBloc.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Customs/PaypalCheckout.dart';
import 'package:ecommerce_app/Screens/CategoryScreen.dart';
import 'package:ecommerce_app/Screens/FavouriteScreen.dart';
import 'package:ecommerce_app/Screens/FeedScreen.dart';
import 'package:ecommerce_app/Screens/HomeScreen.dart';
import 'package:ecommerce_app/Screens/ItemsScreen.dart';
import 'package:ecommerce_app/Screens/LoginScrenn.dart';
import 'package:ecommerce_app/Screens/RegisterScreen.dart';
import 'package:ecommerce_app/SharedPref/SharedPref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/SearchScreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  await Preference.init();
  dynamic token;
 token=Preference.getData(key: "token");
 late  Widget widget;

  if(token==null){
    widget= const LoginScreen();
  }else {
    widget=const HomeScreen();
  }

  runApp(Ecommerce_App(widget: widget,));
}

class Ecommerce_App extends StatelessWidget {
  const Ecommerce_App ({super.key,required this.widget,});
final Widget widget;

  Widget build(BuildContext context) {


    return  MultiBlocProvider(
      providers: [
            BlocProvider(create: (context) => AuthCubit()..GetProfile(),),
        BlocProvider(create: (context) => MainCubit()..GetProduct()..GetCategory()..GetFavourite()..GetCart(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: widget,

       routes: {
         const LoginScreen().id:(context) => const LoginScreen(),
         const ItemsScreen().id:(context) => const ItemsScreen(),
         const FeedScreen().id:(context) => const FeedScreen(),
         const FavouriteScreen().id:(context) => const FavouriteScreen(),
         const RegisterScreen().id:(context) => const RegisterScreen(),
         const HomeScreen().id:(context) =>const HomeScreen(),
         const CategoryScreen().id:(context) =>const CategoryScreen(),
         const SearchScreen().id:(context) =>const SearchScreen(),
         const CheckoutPage().id:(context) =>const CheckoutPage(),

       },

      ),
    );
  }
}
