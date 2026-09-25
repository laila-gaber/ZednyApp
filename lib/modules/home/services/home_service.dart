import 'package:either_dart/either.dart';

import '../../../../core/network/error_handling.dart';
import '../../../../core/utils/Utilities.dart';
import '../data/models/chapter_model.dart';
import '../data/models/lecture_resp_dto.dart';
import '../data/models/save_chapter_req_dto.dart';
import '../data/models/save_lecture_req_dto.dart';
import '../data/models/upload_lecture_image_req_dto.dart';

abstract class HomeService {
  Future<Either<MyError, Profile>> getProfile();

  Future<Either<MyError, List<ChapterModel>>> getChaptersByGrade(String grade);

  Future<Either<MyError, LectureRespDto>> getLectureByRefNo(String refNo);

  Future<Either<MyError, ChapterModel>> saveChapter(SaveChapterReqDto request);

  Future<Either<MyError, LectureRespDto>> saveLecture(SaveLectureReqDto request);

  Future<Either<MyError, bool>> uploadLectureImage(
      UploadLectureImageReqDto request);
}
