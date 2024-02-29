import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/models/Challenge/post-info.dart';
import 'package:task_P2/core/data/models/Challenge/post_photo-info.dart';
import 'package:task_P2/core/data/repository/Challenge-repository/album-repository.dart';
import 'package:task_P2/core/data/repository/Challenge-repository/post-repository.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/shared_widgets/custom-post-view.dart';
import 'package:task_P2/ui/shared/utlis.dart';
import 'package:task_P2/ui/views/posts/create_update_post_view/create_update_post_view.dart';
import 'package:task_P2/ui/views/posts/posts-view/posts-view.dart';

class PostDetailsView extends StatefulWidget {
  final PostInfo post;
  const PostDetailsView({super.key, required this.post});

  @override
  State<PostDetailsView> createState() => _PostViewState();
}

class _PostViewState extends State<PostDetailsView> {
  List<PostPhotoModel> allPhoto = [];
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
            FutureBuilder(
              future: AlbumRepository().getAlbumById(Id: widget.post.id ?? 1),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  snapshot.data!.fold((l) {}, (r) {
                    allPhoto.clear();
                    allPhoto.addAll(r);
                  });
                }
                return snapshot.connectionState == ConnectionState.waiting
                    ? SpinKitCircle(
                        color: AppColors.colorChallenge1,
                      )
                    : allPhoto.length == 0
                        ? Text('No Data')
                        : ListView.builder(
                            padding: EdgeInsetsDirectional.only(
                                top: screenWidth(1.5)),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: allPhoto.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  height: screenWidth(2),
                                  margin: EdgeInsets.only(
                                      top: screenWidth(20),
                                      left: screenWidth(25),
                                      right: screenWidth(25)),
                                  width: screenWidth(1.1),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.colorChallenge2),
                                    color: AppColors.color3,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          allPhoto[index].url ?? '')));
                            },
                          );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: screenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomPostView(
                        editFunc: () {
                          Get.to(CreateUpdatePostView(post: widget.post));
                        },
                        deleteFunc: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        'Cancel',
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        PostRepository()
                                            .deletePosts(id: widget.post.id!)
                                            .then((value) {
                                          value.fold((l) {
                                            BotToast.showText(
                                                text: l,
                                                duration: Duration(seconds: 5));
                                          }, (r) {
                                            BotToast.showText(
                                                text: 'Post is Deleted',
                                                duration: Duration(seconds: 5));
                                          });
                                          Get.offAll(PostsView());
                                        });
                                      },
                                      child: Text('Delete',
                                          style: TextStyle(color: Colors.red))),
                                ],
                                title: Text(
                                  'Delete Post',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text(
                                    'Are you sure you want to delete this post?'),
                              );
                            },
                          );
                        },
                        title: widget.post.title ?? '',
                        body: widget.post.body ?? '',
                        withIcons: true),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenWidth(25), left: screenWidth(20)),
                    child: Text(
                      'Album:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: screenWidth(18),
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorChallenge3),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
    // Container(
    //     child: Text(
    //   widget.postinfo.title.toString(),
    // ));
  }
}
