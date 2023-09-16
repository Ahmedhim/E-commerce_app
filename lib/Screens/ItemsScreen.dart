
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:ecommerce_app/Models/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});
  final id = "ItemsScreen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            iconTheme: const IconThemeData(color: Color(0xff8141ff)),
            shadowColor: Colors.grey,
          ),
          body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
        Expanded(
        child: GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 2,
        mainAxisSpacing: 20,
        ),
        itemCount: BlocProvider.of<MainCubit>(context)
            .model!
            .data!
            .products!
            .length,
        itemBuilder: (context, index) => ItemBuilder(
        BlocProvider.of<MainCubit>(context)
            .model!
            .data!
            .products![index]),
        ),
        )
        ],
        ),
        ),
        );
      },
    );
  }
}

Widget ItemBuilder(ProductModel model) => BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(
                    image: NetworkImage(model.image!),
                    height: 110,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: IconButton(
                        onPressed: () {
                          BlocProvider.of<MainCubit>(context).AddFavourite(id: model.id.toString());

                        },
                        icon:BlocProvider.of<MainCubit>(context).Favourites[model.id]!?
                       const Icon(Icons.favorite,color: Colors.red,)
                            :Icon(
                          Icons.favorite_border,
                          color: Colors.grey[700],
                        )),
                  ),
                  if(model.discount!=null)
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      color: Colors.red,
                      child: const Text("OFFER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Text(model.name!,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      r"$" + "${model.price.toInt()}",
                      style: const TextStyle(
                          color: Color(0xff8141ff),
                          fontWeight: FontWeight.w900),
                    ),
                    const Spacer(),
                    Text(
                      r"$" + "${model.old_price.toInt()}",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.lineThrough),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<MainCubit>(context).AddCart(id: model.id.toString());
                        },
                        icon: const Icon(Icons.shopping_cart_outlined)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
