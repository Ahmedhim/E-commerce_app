import 'package:ecommerce_app/Models/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/MainBloc/MainBloc.dart';
import '../Bloc/MainBloc/MainState.dart';

Widget SearchItem(DeepData model) => BlocBuilder<MainCubit, MainState>(
  builder: (context, state) {
    return Card(
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 120,
            width: 120,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(model.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    maxLines: 1),
                const SizedBox(height: 5),
                Text(model.description,
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
                        r"$" + "${model.price}",
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
                BlocProvider.of<MainCubit>(context).AddFavourite(id: model.id.toString());
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey[700],
              ))
        ],
      ),
    );
  },
);
