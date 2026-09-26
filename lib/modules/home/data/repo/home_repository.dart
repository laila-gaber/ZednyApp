import 'package:either_dart/either.dart';

import '../../../../core/api/api_endpoints.dart';
import '../../../../core/models/response_dto/response_dto.dart';
import '../../../../core/network/error_handling.dart';
import '../../../../core/network/network_handler.dart';

class HomeRepo {
  final api = NetworkHandler();

  Future<Either<MyError, ResponseDto>> getProfile() {
    return api.getDataFromServer(
      url: Endpoints.getProfile,
      withToken: true,
    );
  }

  Future<Either<MyError, ResponseDto>> getChaptersByGrade(String grade) {
    return api.getDataFromServer(
      url: '${Endpoints.getChaptersByGrade}/$grade',
      withToken: true,
    );
  }

  Future<Either<MyError, ResponseDto>> getLectureByRefNo(String refNo) {
    return api.getDataFromServer(
      url: '${Endpoints.getLectureByRefNo}/$refNo',
      withToken: true,
    );
  }

  Future<Either<MyError, ResponseDto>> saveChapter(Map<String, dynamic> data) {
    return api.postDataToServer(
      url: Endpoints.saveChapter,
      data: data,
      object: null,
      withToken: true,
    );
  }

  Future<Either<MyError, ResponseDto>> saveLecture(Map<String, dynamic> data) {
    return api.postDataToServer(
      url: Endpoints.saveLecture,
      data: data,
      object: null,
      withToken: true,
    );
  }

  Future<Either<MyError, ResponseDto>> uploadLectureImage(
      Map<String, dynamic> data) {
    return api.postDataToServer(
      url: Endpoints.uploadLectureImage,
      data: data,
      object: null,
      withToken: true,
    );
  }

  Future<Either<MyError, ResponseDto>> uploadLectureVideo({
    required String filePath,
    required String chapterRefNo,
    required String refNo,
    void Function(int count, int total)? onSendProgress,
  }) {
    return api.uploadVideoMultipart(
      url: Endpoints.uploadLectureVideo,
      filePath: filePath,
      chapterRefNo: chapterRefNo,
      refNo: refNo,
      withToken: true,
      onSendProgress: onSendProgress,
    );
  }
}
