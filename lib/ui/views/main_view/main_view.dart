import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/models/token_info.dart';
import 'package:task_P2/ui/views/main_view/home_view/home_view.dart';
import 'package:task_P2/ui/views/main_view/main_view_widgets/bottom_navigation_bar.dart';
import 'package:task_P2/ui/views/main_view/main_view_widgets/side_menu.dart';
import 'package:task_P2/ui/views/main_view/notification_view/notifications_view.dart';
import 'package:task_P2/ui/views/main_view/prodcuts_view/products_view.dart';
import 'main_controller.dart';
import 'settings_view/settings_view.dart';

class MainView extends StatefulWidget {
  final TokenInfo tokenInfo;
  const MainView({super.key, required this.tokenInfo});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        // key: controller.scafolldKey,
        drawer: SideMenu(),
        bottomNavigationBar: CustomBottmNavigation(
          onTap: (selectedView, index) {
            controller.selecte.value = selectedView;

            controller.pageController.jumpToPage(index);
            //! here notify onTap in navitem
          },
          selectedView: controller.selecte.value,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            HomeView(
              onTap: () {
                // scafolldKey.currentState!.openDrawer();
              },
            ),
            PorductsView(),
            NotificationsView(),
            SettingsView()
          ],
          // onPageChanged: ((index) {
          //   if (index == 0)
          //     setState(() {
          //       selecte = BottomNavigationEnum.HOME;
          //     });
          //   if (index == 1)
          //     setState(() {
          //       selecte = BottomNavigationEnum.FAVORITE;
          //     });
          //   if (index == 2)
          //     setState(() {
          //       selecte = BottomNavigationEnum.NOTIFICATIONS;
          //     });
          //   if (index == 3)
          //     setState(() {
          //       selecte = BottomNavigationEnum.SETTINGS;
          //     });
          // }),
        ),
      );
    }));
  }
}
