import 'package:dartz/dartz.dart';
import 'package:task_P2/core/data/models/common_response.dart';

import 'package:task_P2/core/data/models/user_info.dart';
import 'package:task_P2/core/enums/request_type.dart';
import 'package:task_P2/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, UserInfo>> getUserbyID({
    required int userId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'users/$userId',
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(UserInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<UserInfo>>> getAllUser() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'users',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<UserInfo> result = [];
          commonResponse.data!.forEach((element) {
            result.add(UserInfo.fromJson(element));
          });
          return Right(result);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
