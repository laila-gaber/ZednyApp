import '../../data/models/student_user_dto.dart';

abstract class StudentState {
  const StudentState();
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentSuccess extends StudentState {
  final List<StudentUserDto> students;
  const StudentSuccess(this.students);
}

class StudentFailure extends StudentState {
  final String message;
  const StudentFailure(this.message);
}
