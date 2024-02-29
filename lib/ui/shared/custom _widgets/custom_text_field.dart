import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final bool? notVisible;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const MyTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.validator,
      this.notVisible = false});

  @override
  Widget build(BuildContext context) {
     
    return TextFormField(
      obscureText: notVisible!,
      obscuringCharacter: '*',
      style: TextStyle(color: AppColors.color3),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(70, 77, 83, 1),
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth(20), vertical:screenWidth(14.4)),
        border: InputBorder.none,
        hintText: '$hintText',
        hintStyle: TextStyle(
          color: AppColors.color3,
          fontSize: screenWidth(26),
        ),
      ),
    );
  }
}
