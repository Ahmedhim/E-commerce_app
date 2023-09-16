import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const  CustomButtom({required this.text,this.ontab});
  final String? text;
  final VoidCallback?ontab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontab,
      child: Container(
        width: 250,
        height: 70,
        decoration: BoxDecoration(
            color: const Color(0xff0df5e3),
            borderRadius: BorderRadius.circular(40)
        ),
        child: Center(
          child: Text(
            "$text",
            style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xff1c394a)),
          ),
        ),
      ),
    );
  }
}
