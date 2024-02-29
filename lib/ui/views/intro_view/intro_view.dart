import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/enums/text_style_type.dart';
import 'package:task_P2/core/translation/app_translation.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom_elavated_buttom.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom_text.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/intro_view/intro_controller.dart';
import 'package:task_P2/ui/views/landing_view/landing_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = Get.put(IntroController());

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/pngs/rectangle.png',
              width: screenWidth(1),
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: screenWidth(8),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/pngs/eave.jpg',
                  width: screenWidth(1),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(15)),
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth(1),
                    height: screenWidth(3),
                    child: CustomText(
                      text: controller.descriptions[controller.index.value],
                      alignText: TextAlign.center,
                      styleType: TextStyleType.PX16,
                      textColor: AppColors.color6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/pngs/${controller.images1[controller.index.value]}.png',
                  width: screenWidth(1),
                  fit: BoxFit.fitWidth,
                  // color: Color.fromRGBO(0, 173, 239, 1000),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 0),
                  child: MyElevatedButton(
                    width: screenWidth(1),
                    height: screenWidth(1.95),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom:
                  controller.index.value == 2 ? screenWidth(2.4) : screenWidth(2.5),
              left: controller.index.value == 2 ? screenWidth(7) : screenWidth(4),
              child: Image.asset(
                'assets/images/pngs/${controller.images[controller.index.value]}.png',
                width:
                    controller.index.value == 2 ? screenWidth(1.4) : screenWidth(2),
              )),
          Positioned(
            bottom: screenWidth(20),
            left: screenWidth(2.5),
            child: DotsIndicator(
              dotsCount: controller.images.length,
              position: controller.index.value,
              decorator: DotsDecorator(
                  color: AppColors.color3, activeColor: AppColors.color8),
            ),
          ),
          Positioned(
              bottom: screenWidth(25),
              left: screenWidth(30),
              child: Obx(() {
                return InkWell(
                    onTap: () {
                      controller.back();
                    },
                    child: CustomText(
                      text: controller.index.value < controller.images.length &&
                              controller.index.value > 0
                          ? tr('key_back')
                          : '',
                      textColor: AppColors.color3,
                      styleType: TextStyleType.PX24,
                      alignText: TextAlign.start,
                    ));
              })),
          Positioned(
              bottom: screenWidth(25),
              right: screenWidth(30),
              child: Obx(() {
                return InkWell(
                    onTap: () {
                      controller.next();
                    },
                    child: CustomText(
                      text: controller.index.value < controller.images.length - 1
                          ? tr('key_next')
                          : tr('key_finish'),
                      textColor: AppColors.color3,
                      styleType: TextStyleType.PX24,
                      alignText: TextAlign.end,
                    ));
              })),
          Positioned(
            top: screenWidth(25),
            right: screenWidth(30),
            child: InkWell(
                onTap: () {
                  Get.off(LandingView());
                },
                child: CustomText(
                  text: controller.index.value < controller.images.length - 1
                      ? tr('key_skip')
                      : '',
                  textColor: AppColors.color3,
                  styleType: TextStyleType.PX16,
                  alignText: TextAlign.end,
                )),
          ),
        ],
      ),
    ));
  }
}


// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:task_P2/data/shared_prefrence_repository.dart';
// import 'package:task_P2/ui/shared/colors.dart';
// import 'package:task_P2/ui/shared/custom%20_widgets/custom_elavated_buttom.dart';
// import 'package:task_P2/ui/shared/shared_widgets/custom_text.dart';
// import 'package:task_P2/ui/views/landing_view/landing_view.dart';

// class IntroView extends StatefulWidget {
//   const IntroView({super.key});

//   @override
//   State<IntroView> createState() => _IntroViewState();
// }

// class _IntroViewState extends State<IntroView> {
//   @override
//   void initState() {
//     SharedPrefrenceRepository().setFirstLunch(false);
//     super.initState();
//   }

//   List<String> descriptions = [
//     'Life is a succession of lessons which must be lived to be understood.',
//     'You come into the world with nothing, and the purpose of your life is to make something out of nothing.',
//     ' Life is what happens while you are busy making other plans.'
//   ];
//   List<String> images = ['bag', 'mobile', 'truck'];
//   List<String> images1 = ['city', 'map', 'city'];
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//       // resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/pngs/rectangle.png',
//             width: size.width,
//             fit: BoxFit.fitWidth,
//           ),
//           Image.asset(
//             'assets/images/pngs/eave.jpg',
//             width: size.width,
//             height: size.height / 3,
//             fit: BoxFit.fitWidth,
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.only(top: size.width / 1.15),
//             child: Image.asset(
//               'assets/images/pngs/${images1[index]}.png',
//               width: size.width,
//               fit: BoxFit.fitWidth,
//               // color: Color.fromRGBO(0, 173, 239, 1000),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.only(top: size.width / 0.7),
//             child: MyElevatedButton(
//               width: size.width,
//               height: size.width / 1.6,
//               borderRadius: BorderRadius.zero,
//             ),
//           ),
//           ListView(
//             children: [
//               SizedBox(
//                 height: size.width / 1.8,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 width: size.width,
//                 height: size.width / 3,
//                 child: CustomText(
//                   text: descriptions[index],
//                   alignText: TextAlign.center,
//                   styleType: TextStyleType.PX16,
//                   textColor: AppColors.color6,
//                 ),
//               ),
//               SizedBox(
//                 height: size.width / 18,
//               ),
//               Image.asset(
//                 'assets/images/pngs/${images[index]}.png',
//                 height: size.width / 1.7,
//                 width: size.width / 2,
//               ),
//               SizedBox(
//                 height: size.width / 4,
//               ),
//               DotsIndicator(
//                 dotsCount: images.length,
//                 position: index,
//                 decorator: DotsDecorator(
//                     color: AppColors.color3, activeColor: AppColors.color8),
//               ),
//               Row(
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         if (index < images.length && index > 0)
//                           setState(() {
//                             index--;
//                           });
//                       },
//                       child: CustomText(
//                         text: index < images.length && index > 0 ? 'Back' : '',
//                         textColor: AppColors.color3,
//                         styleType: TextStyleType.PX24,
//                         alignText: TextAlign.start,
//                       )),
//                   Spacer(),
//                   InkWell(
//                       onTap: () {
//                         if (index < images.length - 1)
//                           setState(() {
//                             index++;
//                           });
//                         else
//                           Navigator.pushReplacement(context, MaterialPageRoute(
//                             builder: (context) {
//                               return LandingView();
//                             },
//                           ));
//                       },
//                       child: CustomText(
//                         text: index < images.length - 1 ? 'Next' : 'Finish',
//                         textColor: AppColors.color3,
//                         styleType: TextStyleType.PX24,
//                         alignText: TextAlign.end,
//                       )),
//                 ],
//               )
//             ],
//           ),
//           Container(
//             alignment: Alignment.centerRight,
//             height: size.width / 5,
//             child: InkWell(
//                 onTap: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(
//                     builder: (context) {
//                       return LandingView();
//                     },
//                   ));
//                 },
//                 child: CustomText(
//                   text: index < images.length - 1 ? 'Skip' : '',
//                   textColor: AppColors.color3,
//                   styleType: TextStyleType.PX16,
//                   alignText: TextAlign.end,
//                 )),
//           ),
//         ],
//       ),
//     ));
//   }
// }
