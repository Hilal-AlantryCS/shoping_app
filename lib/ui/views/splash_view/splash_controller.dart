import 'package:get/get.dart';
import 'package:task_P2/ui/views/select_language/select_language_view.dart';
import '../../../core/data/models/token_info.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import '../intro_view/intro_view.dart';
import '../main_view/main_view.dart';

class SplashController extends GetxController {
  void onInit() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(storage.getFirstLunch()
          ? IntroView()
          : storage.getLogedIn()
              ? MainView(tokenInfo: TokenInfo(token: ''))
              : SelectLanguage());

      //* Navigator.pushReplacement(context, MaterialPageRoute(
      //*   builder: (context) {
      //*     return SharedPrefrenceRepository().getFirstLunch()
      //*         ? IntroView()
      //*         : SharedPrefrenceRepository().getLogedIn()
      //*             ? MainView(tokenInfo: TokenInfo(token: ''))
      //*             : LandingView();
      //*   },
      //* ));
    });
    super.onInit();
  }
}
