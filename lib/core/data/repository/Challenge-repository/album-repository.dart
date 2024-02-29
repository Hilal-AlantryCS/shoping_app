import 'package:dartz/dartz.dart';
import 'package:task_P2/core/data/models/Challenge/post_photo-info.dart';
import 'package:task_P2/core/data/models/common_response.dart';
import 'package:task_P2/core/enums/request_type.dart';
import 'package:task_P2/core/utils/network_util.dart';

class AlbumRepository {
  Future<Either<String, List<PostPhotoModel>>> getAlbumById(
      {required int Id}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'albums/$Id/photos',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<PostPhotoModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(PostPhotoModel.fromJson(element));
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
