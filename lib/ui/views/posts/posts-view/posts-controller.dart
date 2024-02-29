import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/repository/Challenge-repository/post-repository.dart';

import '../../../../core/data/models/Challenge/post-info.dart';
import '../post_details_view/post_details_view.dart';

class PostsController extends GetxController {
  RxList<PostInfo> allPost = <PostInfo>[].obs;
  void postDetails(index) {
    Get.to(PostDetailsView(
      post: allPost[index],
    ));
  }

  void onInit() {
    getAllPosts();
    super.onInit();
  }

  getAllPosts() {
    PostRepository().getAllPost().then((value) {
      value.fold((l) => BotToast.showText(text: l), (r) {
        allPost.clear();
        allPost.addAll(r);
      });
    });
  }
}
