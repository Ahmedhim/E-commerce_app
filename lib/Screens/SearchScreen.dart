import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:ecommerce_app/Customs/CustomSearchItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
final id="SearchScreen";
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainCubit,MainState>(
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            iconTheme: const IconThemeData(color: Color(0xff8141ff)),
            title: TextFormField(
              onChanged: (value) {
BlocProvider.of<MainCubit>(context).Search(text: value);
              },
              decoration:const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color:Color(0xff8141ff) ),
                  border: InputBorder.none
              ),
            ),
          ),
          body: Column(
            children: [
              if(state is SearchLoadingState)
        const Expanded(
           child:   Center(
               child: CircularProgressIndicator(
                 color: Color(0xff8141ff),
               ),
             ),
         ),
              if(state is SearchSuccessState)
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchItem( BlocProvider.of<MainCubit>(context)
                          .searchModel!
                          .data.datalist[index],
                      ),
                    ),
                    itemCount: BlocProvider.of<MainCubit>(context)
                        .searchModel
                        ?.data
                    .datalist
                        .length),
              ),
            ],
          ),
        );
      },
    );
  }
}
