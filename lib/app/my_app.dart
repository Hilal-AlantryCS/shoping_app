import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_P2/core/enums/connectivity_status.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/store_view/home_view/store_home_view.dart';
import '../core/translation/app_translation.dart';
import 'my_app_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    MyAppController controller = Get.put(MyAppController());
    return StreamProvider<ConnectivityStatus>(
      create: (context) =>
          connectivitySerivce.connectivityStatusController.stream,
      initialData: ConnectivityStatus.OFFLINE,
      child: GetMaterialApp(
        locale: getLocal(),
        translations: AppTranslation(),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(1, 171, 237, 100)),
        ),
        home: StoreHomeView(),
      ),
    );
  }
}
