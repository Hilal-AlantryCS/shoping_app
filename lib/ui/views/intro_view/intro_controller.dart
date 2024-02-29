import 'package:get/get.dart';

import 'package:task_P2/ui/shared/utlis.dart';
import '../../../core/translation/app_translation.dart';
import '../landing_view/landing_view.dart';

class IntroController extends GetxController {
  void onInit() {
    storage.setFirstLunch(false);
    super.onInit();
  }

  List<String> descriptions = [
    tr('key_intro_1'),
    tr('key_intro_2'),
    tr('key_intro_3'),
  ];
  List<String> images = ['bag', 'mobile', 'truck'];
  List<String> images1 = ['city', 'map', 'city'];
  RxInt index = 0.obs;
  void back() {
    if (index < images.length && index > 0) index--;
  }

  void next() {
    if (index < images.length - 1)
      index++;
    else
      Get.off(LandingView());
  }
}
