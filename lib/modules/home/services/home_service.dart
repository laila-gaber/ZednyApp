import 'package:either_dart/either.dart';

import '../../../../core/network/error_handling.dart';
import '../../../../core/utils/Utilities.dart';
import '../data/models/chapter_model.dart';
import '../data/models/lecture_model.dart';

abstract class HomeService {
  Future<Either<MyError, Profile>> getProfile();

  Future<Either<MyError, List<ChapterModel>>> getChaptersByGrade(String grade);

  Future<Either<MyError, LectureModel>> getLectureByRefNo(String refNo);

  Future<Either<MyError, ChapterModel>> saveChapter({
    required String name,
    required String description,
    required String grade,
    required int order,
  });

  Future<Either<MyError, LectureModel>> saveLecture({
    required String chapterRefNo,
    required String name,
    required String description,
    required String videoUrl,
    required int order,
  });

  Future<Either<MyError, bool>> uploadLectureImage({
    required String refNo,
    required String base64ImageData,
  });
}
