import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_P2/core/data/models/Challenge/post-info.dart';
import 'package:task_P2/core/data/repository/Challenge-repository/post-repository.dart';
import 'package:task_P2/ui/shared/colors.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom-form-field-chall.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class CreateUpdatePostView extends StatefulWidget {
  final PostInfo? post;
  const CreateUpdatePostView({super.key, this.post});

  @override
  State<CreateUpdatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreateUpdatePostView> {
  bool isUpdate = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  void initState() {
    isUpdate = widget.post != null;

    if (isUpdate) {
      titleController.text = widget.post!.title ?? '';
      bodyController.text = widget.post!.body ?? '';
    }

    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.only(
                left: screenWidth(20),
                right: screenWidth(20),
              ),
              children: [
                Container(
                  // decoration: BoxDecoration(color: AppColors.color3),
                  width: screenWidth(1),
                  height: screenWidth(2),
                  child: Center(
                    child: Image.asset(
                      'assets/images/pngs/chall.png',
                      width: screenWidth(1.6),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text(
                  widget.post == null ? 'Add new post' : 'Update post',
                  style: TextStyle(
                      fontSize: screenWidth(16), fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenWidth(20), bottom: screenWidth(30)),
                    child: CustomFieldChall(
                      controller: titleController,
                      hintText: 'Title',
                      maxLines: 3,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Please enter a title";
                        else
                          return null;
                      },
                    )),
                CustomFieldChall(
                    controller: bodyController,
                    maxLines: 15,
                    hintText: 'Body',
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please enter a body";
                      else
                        return null;
                    }),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenWidth(20), bottom: screenWidth(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        widget.post != null
                            ? PostRepository()
                                .updatePost(
                                    title: titleController.text,
                                    body: bodyController.text,
                                    id: widget.post!.id ?? 0)
                                .then((value) {
                                value.fold((l) {
                                  BotToast.showText(
                                      text: l, duration: Duration(seconds: 5));
                                }, (r) {
                                  BotToast.showText(
                                      text: 'Updated successfuly',
                                      duration: Duration(seconds: 5));
                                });
                                Get.back();
                              })
                            : PostRepository()
                                .createPost(
                                    title: titleController.text,
                                    body: bodyController.text)
                                .then((value) {
                                value.fold((l) {
                                  BotToast.showText(
                                      text: l, duration: Duration(seconds: 5));
                                }, (r) {
                                  BotToast.showText(
                                      text: 'Post is created',
                                      duration: Duration(seconds: 5));
                                });

                                Get.back();
                              });
                      }
                    },
                    child: Text(widget.post == null ? 'Save' : 'Update',
                        style: TextStyle(fontSize: screenWidth(15))),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(screenWidth(40))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.colorChallenge4),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
