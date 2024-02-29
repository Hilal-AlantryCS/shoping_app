import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class CustomFieldChall extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? Function(String?)? validator;
  const CustomFieldChall(
      {super.key,
      this.controller,
      this.hintText,
      this.maxLines,
      this.hintStyle, this.style, this.validator});

  @override
  Widget build(BuildContext context) {
     
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.top,
      style: style ?? TextStyle(color: AppColors.color5),
      controller: controller,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.only(
        //     bottom: size.width / 7,
        //     top: size.width / 30,
        //     left: size.width / 30),
        filled: true,
        fillColor: AppColors.color3,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              color: AppColors.color4,
              fontSize: screenWidth(18) ,
            ),
      ),
    );
  }
}
