import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

// enum GradientType {
//   NEWGRADIENT,
//   PROJECTGRADIENT,
// }

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  // final GradientType? typeGradient;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final List<Color>? colorsArray;
  final AlignmentGeometry? childAlign;
  const MyElevatedButton({
    Key? key,
    this.onPressed,
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient,
    this.backgroundColor,
    // this.typeGradient,
    this.colorsArray,
    this.childAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: onPressed,
      child: Container(
          alignment: childAlign,
          width: width ?? screenWidth(1.25) ,
          height: height ?? screenWidth(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            gradient: backgroundColor != null
                ? null
                : LinearGradient(
                    begin: AlignmentDirectional.bottomEnd,
                    end: AlignmentDirectional.topStart,
                    colors: AppColors.gradientColor),
            borderRadius: borderRadius ?? BorderRadius.circular(50),
          ),
          child: child),
    );
  }

  // Gradient? getGradient() {
  //   Gradient? result;
  //   switch (typeGradient) {
  //     case GradientType.PROJECTGRADIENT:
  //       result = LinearGradient(
  //           begin: AlignmentDirectional.bottomEnd,
  //           end: AlignmentDirectional.topStart,
  //           colors: [
  //             Color.fromRGBO(46, 49, 146, 1),
  //             Color.fromRGBO(0, 173, 239, 1),
  //             Color.fromRGBO(0, 173, 239, 1),
  //           ]);

  //       break;
  //     case GradientType.NEWGRADIENT:
  //       result = LinearGradient(
  //           begin: AlignmentDirectional.bottomEnd,
  //           end: AlignmentDirectional.topStart,
  //           colors: colorsArray!);

  //     default:
  //       result = null;
  //   }
  //   return result;
  // }
}
