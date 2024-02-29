import 'package:get/get.dart';

import '../login_view/login_view.dart';
import '../signup_view/signup_view.dart';

class LandingController extends GetxController {
  void login() { Get.to(LoginView());}
  void signUp() {Get.to(SignupView());}
}
