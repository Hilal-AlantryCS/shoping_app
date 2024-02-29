import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/repository/auth_repository.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/main_view/main_view.dart';
import '../signup_view/signup_view.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = 'Malek@gmail.com';
  String password = 'P@ssw0rd';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;

  @override
  void onInit() {
    if (storage.getLoginInfo().isNotEmpty) {
      isChecked.value = true;
      usernameController.text = storage.getLoginInfo()[0];
      passwordController.text = storage.getLoginInfo()[1];
    } else {
      usernameController.text = 'mor_2314';
      passwordController.text = '83r5^_';
    }
    super.onInit();
  }

  void signUp() {
    Get.to(SignupView());
  }

  void login() {
    // Get.offAll(MainView(tokenInfo: TokenInfo()));
    // CommonResponse c1 =
    //     CommonResponse(data: '', message: '', statusCode: 1);
    //  CommonResponse c2 = CommonResponse.fromJson({});
    // if (!isOnline) {
    //   BotToast.showText(text: 'Please check internet connection');
    //   return;
    // }
    if (!isOnline) {
      BotToast.showText(text: 'Please check internet connection');
      return;
    }

    if (!formKey.currentState!.validate()) {
      //* Api Request -----

      isLoading.value = true;
      AuthRepository()
          .login(
              username: usernameController.text,
              password: passwordController.text)
          .then((value) {
        isLoading.value = false;
        value.fold((l) {
          BotToast.showText(text: l);
        }, (r) {
          storage.setTokenInfo(r);
          Get.offAll(MainView(tokenInfo: r));
          // Navigato.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //       builder: ((context) => MainView(
          //             tokenInfo: r,
          //           ))),
          //   (route) {
          //     return false;
          //   },
          // );
        });
      });
    }

    // if (formKey.currentState!.validate()) {
    //   //* Api Request -----

    //   setState(() {
    //     isLoading = true;
    //   });

    //   Future.delayed(Duration(seconds: 2))
    //       .then((value) {
    //     if (usernameController.text == username &&
    //         passwordController.text == password) {
    //       SharedPrefrenceRepository().setLogedIn(true);
    //       Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(
    //               builder: ((context) => MainView())),
    //           (bool) => false);
    //       if (isChecked) {
    //         SharedPrefrenceRepository().setLoginInfo(
    //           [
    //             usernameController.text,
    //             passwordController.text,
    //           ],
    //         );
    //       } else {
    //         SharedPrefrenceRepository()
    //             .setLoginInfo([]);
    //       }
    //     } else {
    //       setState(() {
    //         isLoading = false;
    //       });
    //       BotToast.showText(
    //           text: "Invalid username or password");
    //     }
    //   });
    // }
  }
}
