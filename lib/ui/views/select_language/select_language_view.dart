import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/enums/text_style_type.dart';
import 'package:task_P2/core/translation/app_translation.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom_text.dart';
import 'package:task_P2/ui/views/select_language/Select_language_controller.dart';
import '../../shared/custom _widgets/custom_elavated_buttom.dart';
import '../../shared/utlis.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    SelectLanguageController controller = Get.put(SelectLanguageController());

    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsetsDirectional.only(top: screenWidth(7)),
        children: [
          Center(
            child: Image.asset(
              'assets/images/pngs/language.png',
              width: screenWidth(2),
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(8), bottom: screenWidth(10)),
            child: CustomText(
              text: tr('key_choose_lang'),
              styleType: TextStyleType.PX16,
              textColor: AppColors.color6,
              alignText: TextAlign.center,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(230, 230, 230, 1))),
              width: screenWidth(1.4),
              child: Column(children: [
                Obx(() {
                  return CheckboxListTile(
                    activeColor: AppColors.color7,
                    value: controller.en.value,
                    onChanged: (val) {
                      controller.en.value = val!;
                      controller.ar.value = false;
                      changeLanguage('en');
                    },
                    title: CustomText(
                      text: tr('key_english'),
                      styleType: TextStyleType.PX14,
                      textColor: controller.en.value
                          ? AppColors.color7
                          : AppColors.color6,
                    ),
                  );
                }),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
                Obx(() {
                  return CheckboxListTile(
                    activeColor: AppColors.color7,
                    value: controller.ar.value,
                    onChanged: (val) {
                      controller.ar.value = val!;
                      controller.en.value = false;
                      changeLanguage('ar');
                    },
                    title: CustomText(
                      text: tr('key_arabic'),
                      styleType: TextStyleType.PX14,
                      textColor: controller.ar.value
                          ? AppColors.color7
                          : AppColors.color6,
                    ),
                  );
                })
              ]),
            ),
          ),
          SizedBox(
            height: screenWidth(5),
          ),
          Center(
            child: MyElevatedButton(
              onPressed: () {
                controller.selectedLang();
              },
              child: Center(
                child: CustomText(
                  text: tr('key_done'),
                  styleType: TextStyleType.PX14,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
