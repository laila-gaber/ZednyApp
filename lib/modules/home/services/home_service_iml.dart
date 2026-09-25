import 'dart:convert';
import 'package:either_dart/either.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/network/error_handling.dart';
import '../../../../core/utils/Utilities.dart';
import '../data/models/chapter_model.dart';
import '../data/models/lecture_resp_dto.dart';
import '../data/models/save_chapter_req_dto.dart';
import '../data/models/save_lecture_req_dto.dart';
import '../data/models/upload_lecture_image_req_dto.dart';
import '../data/repo/home_repository.dart';
import 'home_service.dart';

class HomeServiceImpl implements HomeService {
  final HomeRepo _repo;

  HomeServiceImpl(this._repo);

  @override
  Future<Either<MyError, Profile>> getProfile() async {
    final result = await _repo.getProfile();
    return result.map((response) {
      if (response.data != null && response.data is Map<String, dynamic>) {
        final profileMap = response.data as Map<String, dynamic>;
        sharedPrefs.setString('profile', jsonEncode(profileMap));
        return Profile.fromJson(profileMap);
      }
      return Profile();
    });
  }

  @override
  Future<Either<MyError, List<ChapterModel>>> getChaptersByGrade(
      String grade) async {
    final result = await _repo.getChaptersByGrade(grade);
    return result.map((response) {
      if (response.data is List) {
        final list = response.data as List;
        return list
            .map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return <ChapterModel>[];
    });
  }

  @override
  Future<Either<MyError, LectureRespDto>> getLectureByRefNo(
      String refNo) async {
    final result = await _repo.getLectureByRefNo(refNo);
    return result.map((response) {
      if (response.data is Map<String, dynamic>) {
        return LectureRespDto.fromJson(response.data as Map<String, dynamic>);
      }
      return const LectureRespDto(name: '', description: '');
    });
  }

  @override
  Future<Either<MyError, ChapterModel>> saveChapter(
      SaveChapterReqDto request) async {
    final result = await _repo.saveChapter(request.toJson());
    return result.map((response) {
      if (response.data is Map<String, dynamic>) {
        return ChapterModel.fromJson(response.data as Map<String, dynamic>);
      }
      return ChapterModel(
        name: request.name,
        description: request.description,
        grade: request.grade,
      );
    });
  }

  @override
  Future<Either<MyError, LectureRespDto>> saveLecture(
      SaveLectureReqDto request) async {
    final result = await _repo.saveLecture(request.toJson());
    return result.map((response) {
      if (response.data is Map<String, dynamic>) {
        return LectureRespDto.fromJson(response.data as Map<String, dynamic>);
      }
      return LectureRespDto(
        name: request.name,
        description: request.description,
      );
    });
  }

  @override
  Future<Either<MyError, bool>> uploadLectureImage(
      UploadLectureImageReqDto request) async {
    final result = await _repo.uploadLectureImage(request.toJson());
    return result.map((response) => response.status);
  }
}
