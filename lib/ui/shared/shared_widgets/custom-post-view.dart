import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class CustomPostView extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String body;
  final int? lineOfBody;
  final bool withIcons;
  final VoidCallback? editFunc;
  final VoidCallback? deleteFunc;
  const CustomPostView(
      {super.key,
      this.onPressed,
      required this.title,
      required this.body,
      this.lineOfBody,
      this.withIcons = false,
      this.editFunc,
      this.deleteFunc});

  @override
  Widget build(BuildContext context) {
     
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: onPressed,
      child: Container(
          width: screenWidth(1.1),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorChallenge2),
            color: AppColors.color3,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                withIcons == true
                    ? Padding(
                        padding: EdgeInsets.only(bottom: screenWidth(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: editFunc,
                              child: SvgPicture.asset(
                                'assets/images/svgs/edit.svg',
                                width: screenWidth(12),
                              ),
                            ),
                            InkWell(
                              onTap: deleteFunc,
                              child: SvgPicture.asset(
                                'assets/images/svgs/delete.svg',
                                color: Colors.red,
                                width: screenWidth(12),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: screenWidth(25), //17
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorChallenge3),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(body,
                      maxLines: lineOfBody,
                      style: TextStyle(
                        fontSize: screenWidth(27), //16
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
