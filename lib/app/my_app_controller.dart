import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../core/enums/connectivity_status.dart';
import '../ui/shared/utlis.dart';

class MyAppController extends GetxController {
  @override
  void onInit() {
    checkConnection();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onInit();
  }

  void checkConnection() async {
    // Connectivity connectivity = Connectivity();
    // ConnectivityResult result = await connectivity.checkConnectivity();
    // connectivitySerivce.connectivityStatusController
    //     .add(connectivitySerivce.getStatus(result));
    // isOnline =
    //     connectivitySerivce.getStatus(result) == ConnectivityStatus.ONLINE;

    ConnectivityStatus status =
        connectivitySerivce.getStatus(await connectivity.checkConnectivity());

    connectivitySerivce.connectivityStatusController.add(status);
    isOnline = status == ConnectivityStatus.ONLINE;

    connectivitySerivce.connectivityStatusController.stream.listen((event) {
      isOnline = event == ConnectivityStatus.ONLINE;

      //! if (event == ConnectivityStatus.ONLINE)
      //!   isOnline.value = true;
      //! else
      //!   isOnline.value = false;
    });
  }
}
