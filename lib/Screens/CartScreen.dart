import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/MainBloc/MainBloc.dart';
import 'package:ecommerce_app/Models/GetCartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

import '../Bloc/MainBloc/MainState.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
final id="CartScreen";
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MainCubit,MainState>(
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! GetCartLoadingState &&
                BlocProvider.of<MainCubit>(context).getCartModel!.data!.carts.isNotEmpty ,
            builder: (context) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartItem(model: BlocProvider.of<MainCubit>(context)
                            .getCartModel!
                            .data!
                            .carts[index],
                        ),
                      ),
                      itemCount: BlocProvider.of<MainCubit>(context)
                          .getCartModel
                          ?.data!
                          .carts
                          .length),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () async{
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckout(
                            sandboxMode: true,
                            clientId: "AaRSzHdv4CHrtvELsNWL20rShWeeopKTi-C-tZLSbzR3qDBEYMEhQxpjspsOnh5T7-7ZLrfW0a05jIUj",
                            secretKey: "ELVA8PL775gpI9jXyoUkdILQI7aCLOkJtl6vdVUpKTk7ryQFZzwQwOTRuhK2bW-C6f2f2okUVnDzo39S",
                            returnURL: "success.snippetcoder.com",
                            cancelURL: "cancel.snippetcoder.com",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '70',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '70',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description": "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Apple",
                                      "quantity": 4,
                                      "price": '5',
                                      "currency": "USD"
                                    },
                                    {
                                      "name": "Pineapple",
                                      "quantity": 5,
                                      "price": '10',
                                      "currency": "USD"
                                    }
                                  ],

                                  // shipping address is not required though
                                  //   "shipping_address": {
                                  //     "recipient_name": "Raman Singh",
                                  //     "line1": "Delhi",
                                  //     "line2": "",
                                  //     "city": "Delhi",
                                  //     "country_code": "IN",
                                  //     "postal_code": "11001",
                                  //     "phone": "+00000000",
                                  //     "state": "Texas"
                                  //  },
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              print("onSuccess: $params");
                            },
                            onError: (error) {
                              print("onError: $error");
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              print('cancelled:');
                            },
                          ),
                        ));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: const Color(0xff8141ff),borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Text(
                          "Checkout ",style:  TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.white
                        ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
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

Widget CartItem({required CartItems model,}) => BlocBuilder<MainCubit, MainState>(
  builder: (context, state) {
    return Card(
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.product!.image),
            height: 120,
            width: 120,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(model.product!.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    maxLines: 1),
                const SizedBox(height: 5),
                Text(model.product!.desc,
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
                        r"$" + "${model.product!.price}",
                        style: const TextStyle(
                            color: Color(0xff8141ff),
                            fontWeight: FontWeight.w900),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<MainCubit>(context).AddCart(id: model.product!.id.toString());
                          },
                          icon: const Icon(Icons.delete,color: Colors.red,))
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<MainCubit>(context).AddFavourite(id: model.product!.id.toString());
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.grey,
              ))
        ],
      ),
    );
  },
);