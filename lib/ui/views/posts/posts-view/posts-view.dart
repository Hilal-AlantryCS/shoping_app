import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom-post-view.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/posts/create_update_post_view/create_update_post_view.dart';
import 'posts-controller.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  PostsController controller = Get.put(PostsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: AppColors.gradientColorChallenge,
            ),
          ),
          child: Stack(children: [
            Obx(() {
              return controller.allPost.isEmpty
                  ? SpinKitCircle(
                      color: AppColors.colorChallenge1,
                    )
                  : controller.allPost.length == 0
                      ? Text('No Data')
                      : ListView.builder(
                          padding:
                              EdgeInsetsDirectional.only(top: screenWidth(1.8)),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.allPost.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomPostView(
                                  onPressed: () {
                                    controller.postDetails(index);
                                  },
                                  title: controller.allPost[index].title ?? '',
                                  body: controller.allPost[index].body ?? '',
                                  lineOfBody: 3,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          },
                        );
            }),
            Container(
              decoration: BoxDecoration(color: AppColors.color3),
              width: screenWidth(1),
              height: screenWidth(2),
              child: Center(
                child: Image.asset(
                  'assets/images/pngs/chall.png',
                  width: screenWidth(1.3),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              right: screenWidth(25),
              top: screenWidth(25),
              child: InkWell(
                onTap: () {
                  Get.to(CreateUpdatePostView());
                },
                child: SvgPicture.asset(
                  'assets/images/svgs/edit.svg',
                  width: screenWidth(8),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
