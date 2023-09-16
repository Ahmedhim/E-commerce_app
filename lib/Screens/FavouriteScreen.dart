import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/GetFavouriteModel.dart';
import '../Models/HomeModel.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  final id = "FavouriteScreen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! GetFavouriteLoadingState &&
                BlocProvider.of<MainCubit>(context).favouriteModel != null,
            builder: (context) => ListView.builder(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FavouriteItem(model: BlocProvider.of<MainCubit>(context)
                          .favouriteModel!
                          .data
                          .data[index],
                        ),
                    ),
                itemCount: BlocProvider.of<MainCubit>(context)
                    .favouriteModel
                    ?.data
                    .data
                    .length),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: Color(0xff8141ff),
            )),
          ),
        );
      },
    );
  }
}

Widget FavouriteItem({required ItemData model,}) => BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Card(
          child: Row(
            children: [
              Image(
                image: NetworkImage(model.product.image),
                height: 120,
                width: 120,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(model.product.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        maxLines: 1),
                    const SizedBox(height: 5),
                    Text(model.product.description,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            r"$" + "${model.product.price}",
                            style: const TextStyle(
                                color: Color(0xff8141ff),
                                fontWeight: FontWeight.w900),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart_outlined))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<MainCubit>(context).AddFavourite(id: model.product.id.toString());
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ))
            ],
          ),
        );
      },
    );
