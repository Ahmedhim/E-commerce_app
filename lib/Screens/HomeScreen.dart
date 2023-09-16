import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/Auth/AuthBloc.dart';
import 'package:ecommerce_app/Bloc/Auth/AuthState.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'FavouriteScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
final id ="HomeScreen";
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainCubit,MainState>(
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            title: Text(BlocProvider.of<MainCubit>(context).Titles[BlocProvider.of<MainCubit>(context).currentIndex]),
            backgroundColor:const Color(0xff8141ff),
            elevation: 0,
          ),
          body:BlocProvider.of<MainCubit>(context)
              .screens[BlocProvider.of<MainCubit>(context).currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: BlocProvider.of<MainCubit>(context).currentIndex,
            onTap: (value) {
              BlocProvider.of<MainCubit>(context).
              ChangeBottomNavag(value);
            },
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            selectedItemColor:const Color(0xff8141ff),
            items: const[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:"Home" ,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label:"Liked",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label:"Cart" ,
              ),

            ],
          ),
         endDrawer: BlocBuilder<AuthCubit,AuthState>(
           builder: (context, state) {

             return InkWell(
               onTap: () {
                 BlocProvider.of<AuthCubit>(context).GetProfile();
               },
               child: Drawer(
                 backgroundColor:const Color(0xff8141ff),
                 child: ConditionalBuilder(
                   condition:state is!GetProfileLoadingState &&
                       BlocProvider.of<AuthCubit>(context).profileModel?.data!=null ,
                   builder: (context) =>  Padding(
                     padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 20),
                     child: Column(
                       children: [
                       const  CircleAvatar(
                           radius: 64,
                           backgroundColor: Colors.white,
                           child: CircleAvatar(
                             radius: 60,
                             backgroundImage: NetworkImage("https://tse1.mm.bing.net/th?id=OIP._pFDNQ2NiStB0jRNvwhsvQHaHk&pid=Api&rs=1&c=1&qlt=95&w=111&h=114"),

                           ),
                         ),
                         const SizedBox(height: 40),
                         Text(BlocProvider.of<AuthCubit>(context).profileModel!.data!.name!
                           ,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                         const SizedBox(height: 50,),
                         Row(
                           children: [
                             const Icon(Icons.email,color: Colors.white ,),
                             Text(BlocProvider.of<AuthCubit>(context).profileModel!.data!.email!,
                               style: const TextStyle(color: Colors.white,
                                 fontWeight: FontWeight.bold,fontSize: 14,),),
                           ],
                         ),
                         const SizedBox(height: 20,),
                         Row(
                           children: [
                             const Icon(Icons.phone,color: Colors.white ,),
                             Text(BlocProvider.of<AuthCubit>(context).profileModel!.data!.phone!
                               ,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                           ],
                         ),
                         const SizedBox(height: 20,),
                         InkWell(
                           onTap: () {
                             Navigator.pushNamed(context,const FavouriteScreen().id);
                           },
                           child:const Row(
                             children: [
                               Icon(Icons.favorite,color: Colors.red ,),
                               Text("Your Favourites",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                             ],
                           ),
                         ),
                         const SizedBox(height: 20,),
                         InkWell(
                           onTap: () {
                             BlocProvider.of<AuthCubit>(context).Logout(context);
                           },
                           child:const Row(
                             children: [
                               Icon(Icons.login_outlined,color: Colors.white ,),
                               Text("Logout",style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                             ],
                           ),
                         ),
const SizedBox(height: 40),
                         GestureDetector(
                           onTap: () {

                           },
                           child: Container(
                             width: double.infinity,
                             alignment: AlignmentDirectional.center,
                             decoration: BoxDecoration(
                               color: Colors.white,borderRadius: BorderRadius.circular(10),
                             ),
                             child: const Padding(
                               padding:  EdgeInsets.all(10.0),
                               child:  Text(
                                 "Update ",style:  TextStyle(
                                 fontWeight: FontWeight.bold,color: Color(0xff8141ff)
                               ),
                               ),
                             ),
                           ),
                         ),

                       ],
                     ),
                   ),
                   fallback:(context) =>  const Center(
                       child: CircularProgressIndicator(
                         color: Colors.white,
                       )),
                 ),
               ),
             );
           },
         ),
        );
      },
    );
  }
}


