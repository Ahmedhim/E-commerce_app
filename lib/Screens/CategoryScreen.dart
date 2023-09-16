import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:ecommerce_app/Models/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
final id="CategoryScreen";
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainCubit,MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff8141ff),
            elevation: 0,
            title: const Text("Categories"),
          ),
          body: ConditionalBuilder(
            condition: state is! GetCategoryLoadingState,
            builder: (context) => ListView.separated(itemBuilder: (context, index) =>
                CategoryItem(BlocProvider.of<MainCubit>(context).categoryModel!.data!.data![index]),
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount:BlocProvider.of<MainCubit>(context).categoryModel!.data!.data!.length ),
            fallback:(context) => const Center(
              child: CircularProgressIndicator(
                backgroundColor:  Color(0xff8141ff),
              ),
            ) ,
          ),
        );
      },
    );
  }
}
Widget CategoryItem(CategoryDataDetails model)=>Row(
  children: [
    Image(image: NetworkImage(model.image!),height: 150,),
   const Spacer(),
    Text(model.name!,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
  ],
);