import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:task_P2/core/data/models/user_info.dart';
import 'package:task_P2/core/data/repository/user_repository.dart';
import 'package:task_P2/ui/shared/colors.dart';

class TestUserInfo extends StatefulWidget {
  const TestUserInfo({super.key});

  @override
  State<TestUserInfo> createState() => _TestUserInfoState();
}

class _TestUserInfoState extends State<TestUserInfo> {
  @override
  // ignore: override_on_non_overriding_member
  List<UserInfo> allusersinfo = [];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          FutureBuilder(
            future: UserRepository().getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                snapshot.data!.fold((l) {}, (r) {
                  allusersinfo.clear();
                  allusersinfo.addAll(r);
                });
              }
              return snapshot.connectionState == ConnectionState.waiting
                  ? SpinKitCircle(
                      color: AppColors.color1,
                    )
                  : allusersinfo.length == 0
                      ? Text('No Data')
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: allusersinfo.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Text(allusersinfo[index]
                                    .name!
                                    .firstname
                                    .toString()),
                                Text(allusersinfo[index]
                                    .name!
                                    .lastname
                                    .toString()),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        );
            },
          ),
        ]),
      ),
    );
  }
}
