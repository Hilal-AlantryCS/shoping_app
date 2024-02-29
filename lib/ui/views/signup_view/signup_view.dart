import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/enums/text_style_type.dart';
import 'package:task_P2/core/translation/app_translation.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom_sign_withfacebook.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom_text_field.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom_text.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/signup_view/signup_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/pngs/main_background.png',
              width: screenWidth(1),
              fit: BoxFit.fitWidth,
            ),
            Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: screenWidth(6.2),
                        top: screenWidth(2.22),
                        end: screenWidth(2.9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.login();
                          },
                          child: CustomText(
                            text: tr('key_login'),
                            styleType: TextStyleType.PX20,
                            textColor: AppColors.color4,
                          ),
                        ),
                        CustomText(
                          text: tr('key_sign_up'),
                          styleType: TextStyleType.PX20,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: screenWidth(6.2), top: screenWidth(5.7)),
                    child: MyTextField(
                      controller: controller.usernameController,
                      hintText: tr('key_email'),
                      validator: (value) {
                        //!--- value => usernameController.text
                        if (value!.isEmpty)
                          return tr('key_please_enter_email');
                        else if (!isEmailValid(value))
                          return tr('key_please_enter_valid_email');
                        else
                          return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: screenWidth(6.2), top: screenWidth(250)),
                    child: MyTextField(
                      controller: controller.passwordController,
                      notVisible: true,
                      hintText: tr('key_password'),
                      validator: (value) {
                        if (!isComplexPassword(value!))
                          return tr('key_please_enter_valid_password');
                        else
                          return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: screenWidth(6.2), top: screenWidth(250)),
                    child: MyTextField(
                      controller: controller.confirmPasswordController,
                      notVisible: true,
                      hintText: tr('key_confirm_password'),
                      validator: (value) {
                        if (value!.isEmpty)
                          return tr('key_please_confirm_your_password');
                        else if (!(value == controller.passwordController.text))
                          return tr('key_password_not_complete_match');
                        else
                          return null;
                      },
                    ),
                  ),
                  Obx(() {
                    return controller.isLoading.value
                        ? SpinKitCircle(
                            color: AppColors.color3,
                          )
                        : InkWell(
                            onTap: () {
                              controller.signup();
                            },
                            child: Container(
                              alignment: AlignmentDirectional(-0.8, 0),
                              margin: EdgeInsetsDirectional.only(
                                start: screenWidth(6.2),
                              ),
                              height: screenWidth(6.6),
                              color: Colors.transparent,
                              child: CustomText(
                                text: tr('key_sign_up'),
                                styleType: TextStyleType.PX14,
                              ),
                            ),
                          );
                  }),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: screenWidth(6.2), top: screenWidth(5.7)),
                    child: SignWithFacebook(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
