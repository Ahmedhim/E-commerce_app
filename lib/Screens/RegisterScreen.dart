import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/Bloc/Auth/AuthBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Bloc/Auth/AuthState.dart';
import '../Customs/CustomButton.dart';
import '../Customs/CustomTextFormFIield.dart';
import 'HomeScreen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  final id="RegisterScreen";
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is SuccessRegisterApiState){
          Navigator.of(context).pushNamedAndRemoveUntil(const HomeScreen().id, (route) => false);
        }
      },
      builder: (context, state) {
        var NameController=TextEditingController();
        var PhoneController=TextEditingController();
        var EmailController=TextEditingController();
        var PaswordController=TextEditingController();
        return Scaffold(
          backgroundColor: const Color(0xff201a30),
          appBar: AppBar(
            backgroundColor: const Color(0xff201a30),
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "Please fill the input below here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff5d5968)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomFormTextField(
                      icon: FontAwesomeIcons.user,
                      controller: NameController,
                      label: "FULL NAME",
                      keyboard: TextInputType.name),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    controller: PhoneController,
                      icon: FontAwesomeIcons.mobileScreen,
                      label: "Phone",
                      keyboard: TextInputType.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    controller: EmailController,
                      icon: Icons.email_outlined,
                      label: "EMAIL",
                      keyboard: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    controller: PaswordController,
                      icon: Icons.lock_outlined,
                      label: "PASSWORD",
                      obsecure: true,
                      keyboard: TextInputType.visiblePassword),
                  const SizedBox(height: 30,),
                   ConditionalBuilder(
                     condition: state is! LoadingRegisterState,
                     builder: (context) => Center(child: CustomButtom(text: "SIGN UP",
                       ontab:() {
                         BlocProvider.of<AuthCubit>(context).Reg(email: EmailController.text,
                            password:  PaswordController.text,name: NameController.text,phone: PhoneController.text,);
                       }, )),
                     fallback: (context) => const Center(
                       child: CircularProgressIndicator(
                         color: Color(0xff0df5e3) ,
                       ),
                     ),
                   ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have a account?",
                        style: TextStyle(
                            color: Color(0xff5d5968),
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign in",
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
