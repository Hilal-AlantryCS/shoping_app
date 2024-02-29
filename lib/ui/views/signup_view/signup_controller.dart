import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/translation/app_translation.dart';
import '../login_view/login_view.dart';

class SignupController extends GetxController {
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  String username = 'Malek@gmail.com';
  String password = 'P@ssw0rd';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  void login() {
    Get.to(LoginView());
  }

  void signup() {
    if (formKey.currentState!.validate()) {
      //* Api Request -----

      isLoading.value = true;

      Future.delayed(Duration(seconds: 2)).then((value) {
        if (usernameController.text == username &&
            passwordController.text == password) {
          Get.off(LoginView());
        } else {
          isLoading.value = false;

          BotToast.showText(text: tr('key_invalid_username_or_password'));
        }
      });
    }
  }
}
