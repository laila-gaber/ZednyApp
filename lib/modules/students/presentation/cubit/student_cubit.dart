import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/student_user_dto.dart';
import '../../services/student_service.dart';
import 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentService _studentService;

  StudentCubit(this._studentService) : super(StudentInitial());

  final TextEditingController searchController = TextEditingController();

  List<StudentUserDto> allStudents = [];
  List<StudentUserDto> filteredStudents = [];

  Future<void> fetchStudents({required S s}) async {
    emit(StudentLoading());

    final result = await _studentService.getStudents(page: 0, size: 50);

    result.fold(
      (error) {
        emit(
          StudentFailure(error.message ?? s.failedToFetchStudents),
        );
      },
      (data) {
        allStudents = data;
        _applyFilter(searchController.text);
        emit(StudentSuccess(filteredStudents));
      },
    );
  }

  void searchStudents(String query) {
    _applyFilter(query);
    emit(StudentSuccess(filteredStudents));
  }

  void _applyFilter(String query) {
    final cleanQuery = query.trim().toLowerCase();
    if (cleanQuery.isEmpty) {
      filteredStudents = List.from(allStudents);
    } else {
      filteredStudents = allStudents.where((student) {
        final profile = student.profile;
        final name = profile?.name?.toLowerCase() ?? '';
        final phone = profile?.phone ?? '';
        final parentPhone = profile?.parentPhone ?? '';
        final grade = profile?.grade?.toLowerCase() ?? '';

        return name.contains(cleanQuery) ||
            phone.contains(cleanQuery) ||
            parentPhone.contains(cleanQuery) ||
            grade.contains(cleanQuery);
      }).toList();
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
