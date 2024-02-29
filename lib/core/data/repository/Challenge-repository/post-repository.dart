import 'package:dartz/dartz.dart';
import 'package:task_P2/core/data/models/Challenge/post-info.dart';
import 'package:task_P2/core/data/models/common_response.dart';
import 'package:task_P2/core/enums/request_type.dart';
import 'package:task_P2/core/utils/network_util.dart';

class PostRepository {
  Future<Either<String, List<PostInfo>>> getAllPost() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'posts',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<PostInfo> result = [];
          commonResponse.data!.forEach((element) {
            result.add(PostInfo.fromJson(element));
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

  Future<Either<String, PostInfo>> createPost({
    required String title,
    required String body,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          route: 'posts',
          body: {"title": title, "body": body, "userId": '1'}).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(PostInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PostInfo>> updatePost({
    required String title,
    required String body,
    required int id,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.PUT,
          route: 'posts/$id',
          body: {
            "title": title,
            "body": body,
            "userId": '1',
            
          }).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(PostInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> deletePosts({
    required int id,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        route: 'posts/$id',
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
