import 'package:either_dart/either.dart';

import '../../../../core/network/error_handling.dart';
import '../data/models/student_user_dto.dart';

abstract class StudentService {
  Future<Either<MyError, List<StudentUserDto>>> getStudents({
    int page = 0,
    int size = 50,
  });
}
