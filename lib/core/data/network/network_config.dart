import 'package:task_P2/core/enums/request_type.dart';
import 'package:task_P2/ui/shared/utlis.dart';
class NetworkConfig {
  static Map<String, String> getHeaders(
      {bool? needAuth = false,
      required RequestType type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth!) "Authorization": "Bearer ${storage.getTokenInfo().token}",
      if (type != RequestType.GET) "Content-Type": "application/json",
      if (extraHeaders != null) ...extraHeaders,
      "Accept-Language": storage.getAppLanguage()
    };
  }
}
