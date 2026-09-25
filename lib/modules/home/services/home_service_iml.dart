import 'dart:convert';
import 'package:either_dart/either.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/network/error_handling.dart';
import '../../../../core/utils/Utilities.dart';
import '../data/models/chapter_model.dart';
import '../data/models/lecture_model.dart';
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
  Future<Either<MyError, LectureModel>> getLectureByRefNo(
      String refNo) async {
    final result = await _repo.getLectureByRefNo(refNo);
    return result.map((response) {
      if (response.data is Map<String, dynamic>) {
        return LectureModel.fromJson(response.data as Map<String, dynamic>);
      }
      return const LectureModel(name: '', description: '');
    });
  }

  @override
  Future<Either<MyError, ChapterModel>> saveChapter({
    required String name,
    required String description,
    required String grade,
    required int order,
  }) async {
    final body = {
      'name': name,
      'description': description,
      'grade': grade,
      'chapterOrder': order,
    };
    final result = await _repo.saveChapter(body);
    return result.map((response) {
      if (response.data is Map<String, dynamic>) {
        return ChapterModel.fromJson(response.data as Map<String, dynamic>);
      }
      return ChapterModel(name: name, description: description, grade: grade);
    });
  }

  @override
  Future<Either<MyError, LectureModel>> saveLecture({
    required String chapterRefNo,
    required String name,
    required String description,
    required String videoUrl,
    required int order,
  }) async {
    final body = {
      'chapterRefNo': chapterRefNo,
      'name': name,
      'description': description,
      'videoUrl': videoUrl,
      'imageUrl': '',
      'order': order,
      'price': 0,
      'free': true,
    };
    final result = await _repo.saveLecture(body);
    return result.map((response) {
      if (response.data is Map<String, dynamic>) {
        return LectureModel.fromJson(response.data as Map<String, dynamic>);
      }
      return LectureModel(name: name, description: description);
    });
  }

  @override
  Future<Either<MyError, bool>> uploadLectureImage({
    required String refNo,
    required String base64ImageData,
  }) async {
    final body = {
      'refNo': refNo,
      'imageData': base64ImageData,
      'count': 0,
    };
    final result = await _repo.uploadLectureImage(body);
    return result.map((response) => response.status);
  }
}
