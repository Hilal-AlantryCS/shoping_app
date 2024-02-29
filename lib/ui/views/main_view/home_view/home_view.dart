import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/main_view/home_view/home_controller.dart';

class HomeView extends StatefulWidget {
  final Function onTap;
  const HomeView({
    super.key,
    required this.onTap,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // Obx(() {
            //   return Stack(
            //     alignment: AlignmentDirectional.topCenter,
            //     children: [
            //       CarouselSlider(
            //         carouselController: controller.carousecontroller,
            //         items: controller.items
            //             .map(
            //               (item) => Image.network(
            //                 item,
            //                 fit: BoxFit.cover,
            //                 width: double.infinity,
            //               ),
            //             )
            //             .toList(),
            //         options: CarouselOptions(
            //           height: 400,
            //           autoPlay: true,
            //           onPageChanged: (index, reason) {
            //             controller.currentIndex.value = index;
            //           },
            //         ),
            //       ),
            //       Positioned(
            //         bottom: 8.0,
            //         child: DotsIndicator(
            //           dotsCount: controller.items.length,
            //           position: controller.currentIndex.value,
            //           onTap: (index) {
            //             controller.carousecontroller.animateToPage(index);
            //           },
            //           decorator: DotsDecorator(
            //             color: Colors.white,
            //             activeColor: Colors.amber,
            //             size: const Size.square(12.0),
            //             activeSize: const Size(24.0, 12.0),
            //             activeShape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   );
            // }),
            // Container(
            //   height: screenWidth(2),
            //   color: Colors.red,
            //   child: GridView(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3),
            //     children: [
            //       Text('data'),
            //       Text('data'),
            //       Text('data'),
            //       Text('data'),
            //       Text('data'),
            //       Text('data'),
            //     ],
            //   ),
            // ),
            // Obx(
            //   () => Icon(
            //     controller.isOnline.value ? Icons.wifi : Icons.wifi_off,
            //     color:
            //         controller.isOnline.value ? Colors.green : Colors.red[300],
            //     size: 60,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
