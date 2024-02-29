import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/enums/text_style_type.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? textColor;
  final TextAlign? alignText;

  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomText({
    super.key,
    required this.text,
    this.styleType,
    this.textColor = AppColors.color3,
    this.fontWeight = FontWeight.normal,
    this.fontSize,
    this.alignText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(Get.size),
      textAlign: alignText,
    );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.PX12:
        result = TextStyle(
            fontSize: screenWidth(31),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.PX14:
        result = TextStyle(
            fontSize: screenWidth(26.8),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.PX16:
        result = TextStyle(
            fontSize: screenWidth(23.5),
            fontWeight: fontWeight,
            color: textColor);
        break;
      case TextStyleType.PX20:
        result = TextStyle(
            fontSize: screenWidth(18.8),
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor);
        break;
      case TextStyleType.PX24:
        result = TextStyle(
            fontSize: screenWidth(15.6),
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor);
        break;
      case TextStyleType.PX34:
        result = TextStyle(
            fontSize: screenWidth(11),
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor);
        break;
      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;

      default:
        result = TextStyle(
            fontSize: screenWidth(26.8),
            fontWeight: fontWeight,
            color: textColor);
        break;
    }

    return result;
  }
}
