import 'package:get/get.dart';

import 'languages/ar_language.dart';
import 'languages/en_language.dart';
import 'languages/fr_language.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': ENLangauge.map,
        'ar_SA': ARLangauge.map,
        'fr_FR': FRLangauge.map,
      };
}
tr(String key) => key.tr;