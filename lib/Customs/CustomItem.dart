import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:ecommerce_app/Models/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/MainBloc/MainBloc.dart';

Widget CustomItem(ProductModel model,) => BlocBuilder<MainCubit,MainState>(
  builder: (context, state) {
    return  Container(
      width: 200,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image(
                    image: NetworkImage(model.image!),
                    height: 150,
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<MainCubit>(context).AddFavourite(id: model.id.toString());
                      },
                      icon:BlocProvider.of<MainCubit>(context).Favourites[model.id]!?
                      const Icon(Icons.favorite,color: Colors.red,)
                          :Icon(
                        Icons.favorite_border,
                        color: Colors.grey[700],
                      )),
                ],
              ),
              Text(
                model.name!,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    r"$" + "${model.price.toInt()}",
                    style: const TextStyle(
                        color: Color(0xff8141ff), fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    r"$" + "${model.old_price.toInt()}",
                    style: const TextStyle(
                        color: Colors.grey,fontWeight: FontWeight.w900,decoration: TextDecoration.lineThrough),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<MainCubit>(context).AddCart(id: model.id.toString());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
);
