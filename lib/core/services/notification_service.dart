// import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';

// import 'package:get/utils.dart';
// import 'package:task_P2/core/data/models/notification_model.dart';
// import 'package:task_P2/core/data/repository/user_repository.dart';
// import 'package:task_P2/ui/shared/utlis.dart';
// import 'package:task_P2/ui/views/main_view/prodcuts_view/products_view.dart';

// enum AppState { TERMINATED, BACKGROUND, FOREGROUND }

// class NotificationService {
//   StreamController<NotifictionModel> notifcationStream =
//       StreamController<NotifictionModel>.broadcast();

//   NotificationService() {
//     onInit();
//   }

//   void onInit() async {
//     if (GetPlatform.isIOS) {
//       FirebaseMessaging messaging = FirebaseMessaging.instance;

//       NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );

//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         await registerdFCMToken();
//       } else {
//         return;
//       }
//     } else {
//       await registerdFCMToken();
//     }

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       NotifictionModel model = NotifictionModel.fromJson(message.data);
//       handelNotification(model: model, appState: AppState.FOREGROUND);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       NotifictionModel model = NotifictionModel.fromJson(message.data);
//       handelNotification(model: model, appState: AppState.BACKGROUND);
//     });
//   }

//   Future<void> registerdFCMToken() async {
//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     //*authRepository.updateFcmToken(fcmToken: fcmToken ?? '');

//     FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
//       //* authRepository.updateFcmToken(fcmToken: fcmToken );

//       //! -- Call api that register fcm token ---
//       // TODO: If necessary send token to application server.

//       // Note: This callback is fired at each app startup and whenever a new
//       // token is generated.
//     }).onError((err) {
//       // Error getting token.
//     });
//   }

//   void handelNotification(
//       {required NotifictionModel model, required AppState appState}) {
//     notifcationStream.add(model);
//     if (appState == AppState.FOREGROUND) {
//       //! -- show notification
//     } else {
//       if (model.notifctionType == 'order') {
//         Get.to(PorductsView());
//       }
//     }
//   }
// }
