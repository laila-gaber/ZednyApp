import 'package:either_dart/either.dart';

import '../../../../core/network/error_handling.dart';
import '../data/models/student_user_dto.dart';
import '../data/repo/student_repository.dart';
import 'student_service.dart';

class StudentServiceImpl implements StudentService {
  final StudentRepo _repo;

  StudentServiceImpl(this._repo);

  @override
  Future<Either<MyError, List<StudentUserDto>>> getStudents({
    int page = 0,
    int size = 50,
  }) async {
    final result = await _repo.getStudents(page: page, size: size);
    return result.map((response) {
      if (response.data is List) {
        final list = response.data as List;
        return list
            .map((e) => StudentUserDto.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return <StudentUserDto>[];
    });
  }
}
