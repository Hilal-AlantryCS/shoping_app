import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/translation/app_translation.dart';
import 'package:task_P2/ui/views/landing_view/landing_view.dart';

import '../../shared/utlis.dart';

class SelectLanguageController extends GetxController {
  RxBool en = false.obs;
  RxBool ar = false.obs;
  void selectedLang() {
    !ar.value && !en.value
        ? BotToast.showText(text: tr('key_Please_select'))
        : ar.value
            ? {changeLanguage('ar'), Get.to(LandingView())}
            : {changeLanguage('en'), Get.to(LandingView())};
  }
}
