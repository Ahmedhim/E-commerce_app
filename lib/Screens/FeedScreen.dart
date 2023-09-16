import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainState.dart';
import 'package:ecommerce_app/Screens/CategoryScreen.dart';
import 'package:ecommerce_app/Screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Customs/CustomItem.dart';
import 'ItemsScreen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  final id = "FeedScreen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var SearchController = TextEditingController();
        return ConditionalBuilder(
            condition:
               state is! GetProductLoadingState&& BlocProvider.of<MainCubit>(context).model!=null,
            builder: (context) => Scaffold(
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 160,
                              decoration: const BoxDecoration(
                                  color: Color(0xff8141ff),
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(30),
                                    bottomEnd: Radius.circular(30),
                                  )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "SHOPING",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: TextFormField(
                                        maxLines: 1,
                                        onTap: () {
                                          Navigator.pushNamed(context, const SearchScreen().id);
                                        },
                                        controller: SearchController,
                                        decoration: InputDecoration(
                                            prefixIconColor: Colors.grey[700],
                                            prefixIcon:
                                                const Icon(Icons.search),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[700])),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 120, bottom: 20, right: 20, left: 20),
                              child: Card(
                                  elevation: 1,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: NetworkImage(
                                            "https://tse3.mm.bing.net/th?id=OIP.H9WWGWLiwSE8TE15QgeQ1QHaHa&pid=Api&P=0&h=180"),
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Introducing",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(height: 5),
                                          const Text(
                                            "Air Max 2090",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(height: 10),
                                          MaterialButton(
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            color: Colors.black,
                                            onPressed: () {},
                                            child: const Text("Buy Now",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context,const CategoryScreen().id);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xff8141ff)
                                              .withOpacity(.2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.category_outlined,
                                            color: Color(0xff8141ff), size: 40),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Category",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffbe8efe)
                                            .withOpacity(.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.compare_outlined,
                                          color: Color(0xffbe8efe), size: 40),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Compare",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffc150d9)
                                            .withOpacity(.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.local_offer_outlined,
                                          color: Color(0xffc150d9), size: 40),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Sales event",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xfffe7550)
                                            .withOpacity(.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.percent_outlined,
                                          color: Color(0xfffe7550), size: 40),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Offers",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 30),
                          child: Row(
                            children: [
                              const Text("New Arrivals",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 20)),
                              const Spacer(),
                              MaterialButton(
                                shape: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff8141ff)),
                                    borderRadius: BorderRadius.circular(8)),
                                color: const Color(0xff8141ff),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, const ItemsScreen().id);
                                },
                                child: const Text("View All",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: CustomItem(
                                        BlocProvider.of<MainCubit>(context)
                                            .model!
                                            .data!
                                            .products![index],),
                                  ),
                              itemCount: 7),
                        ),
                      ],
                    ),
                  ),
                ),
            fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff8141ff),
                )));
      },
    );
  }
}
