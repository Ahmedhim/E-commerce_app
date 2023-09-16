import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/Auth/AuthBloc.dart';
import 'package:ecommerce_app/Bloc/Auth/AuthState.dart';
import 'package:ecommerce_app/Customs/CustomButton.dart';
import 'package:ecommerce_app/Screens/HomeScreen.dart';
import 'package:ecommerce_app/Screens/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Customs/CustomTextFormFIield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
final id="LoginScreen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is SuccessLoginApiState){
          Navigator.of(context).pushNamedAndRemoveUntil(const HomeScreen().id, (route) => false);
        }
      },
      builder: (context, state) {

        var EmailCotroller=TextEditingController();
        var PasswordController=TextEditingController();
        return Scaffold(
          backgroundColor: const Color(0xff201a30),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  const  Center(
                      child:
                      Image(image: AssetImage("lib/assets/LogiinScreen.png"))),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Please sign in to continue.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff5d5968)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFormTextField(
                      icon: Icons.email_outlined,
                      controller:EmailCotroller ,
                      label: "EMAIL",
                      keyboard: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                      icon: Icons.lock_outlined,
                      controller: PasswordController,
                      label: "PASSWORD",
                      obsecure: true,
                      keyboard: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoadingLoginState,
                    builder:(context) => Center(child: CustomButtom(text: "LOGIN",
                      ontab:() {
                        BlocProvider.of<AuthCubit>(context).Login(email: EmailCotroller.text,
                           password:  PasswordController.text);
                      }, )),
                    fallback: (context) =>const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff0df5e3) ,
                      ),
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?",
                          style: TextStyle(color: Color(0xff0fc5ba))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Color(0xff5d5968),
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, const RegisterScreen().id);
                        },
                        child:const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0df5e3)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
