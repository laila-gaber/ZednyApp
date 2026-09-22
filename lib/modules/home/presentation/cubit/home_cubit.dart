import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/toast_manager.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/chapter_model.dart';
import '../../data/models/code_type_enum.dart';
import '../../data/models/student_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Navigation State
  int currentTabIndex = 0;

  // Codes Form State
  CodeTypeEnum selectedCodeType = CodeTypeEnum.lecture;
  String? selectedLecture;
  final TextEditingController codeCountController =
      TextEditingController(text: '5');

  // Students Search State
  final TextEditingController searchStudentController =
      TextEditingController();

  // Mock Data Collections
  List<ChapterModel> chapters = const [
    ChapterModel(
      id: '1',
      title: 'الفصل الأول: المقدمات',
      lecturesCount: 4,
      grade: 'الأول الثانوي',
      accentColor: MyColors.primary,
    ),
    ChapterModel(
      id: '2',
      title: 'الفصل الثاني: المفاهيم',
      lecturesCount: 6,
      grade: 'الأول الثانوي',
      accentColor: MyColors.green,
    ),
    ChapterModel(
      id: '3',
      title: 'الفصل الثالث: التطبيقات',
      lecturesCount: 5,
      grade: 'الثاني الثانوي',
      accentColor: MyColors.myBrown,
    ),
    ChapterModel(
      id: '4',
      title: 'الفصل الرابع: المسائل المتقدمة',
      lecturesCount: 3,
      grade: 'الثالث الثانوي',
      accentColor: MyColors.softBlue,
    ),
  ];

  final List<StudentModel> _allStudents = const [
    StudentModel(
      id: '1',
      name: 'أحمد محمد علي',
      avatarInitial: 'أ',
      grade: 'الثالث الثانوي',
      completedLectures: 8,
      totalLectures: 12,
    ),
    StudentModel(
      id: '2',
      name: 'فاطمة إبراهيم حسن',
      avatarInitial: 'ف',
      grade: 'الثاني الثانوي',
      completedLectures: 10,
      totalLectures: 10,
    ),
    StudentModel(
      id: '3',
      name: 'محمود سامي الدين',
      avatarInitial: 'م',
      grade: 'الأول الثانوي',
      completedLectures: 3,
      totalLectures: 10,
      isBlocked: true,
      warningsCount: 3,
    ),
    StudentModel(
      id: '4',
      name: 'نور عبدالله محمد',
      avatarInitial: 'ن',
      grade: 'الثالث الثانوي',
      completedLectures: 11,
      totalLectures: 12,
      warningsCount: 1,
    ),
    StudentModel(
      id: '5',
      name: 'يوسف أحمد طارق',
      avatarInitial: 'ي',
      grade: 'الثاني الثانوي',
      completedLectures: 7,
      totalLectures: 10,
    ),
  ];

  List<StudentModel> filteredStudents = [];

  final List<String> lectureList = const [
    'المحاضرة الأولى - المقدمات',
    'المحاضرة الثانية - المفاهيم',
    'المحاضرة الثالثة - التطبيقات',
    'المحاضرة الرابعة - المسائل المتقدمة',
  ];

  void initData() {
    filteredStudents = List.from(_allStudents);
    emit(HomeDataUpdated());
  }

  void changeTab(int index) {
    currentTabIndex = index;
    emit(HomeTabChanged(currentTabIndex));
  }

  void changeCodeType(CodeTypeEnum type) {
    selectedCodeType = type;
    emit(HomeDataUpdated());
  }

  void selectLecture(String? lecture) {
    selectedLecture = lecture;
    emit(HomeDataUpdated());
  }

  void searchStudents(String query) {
    if (query.trim().isEmpty) {
      filteredStudents = List.from(_allStudents);
    } else {
      filteredStudents = _allStudents
          .where((student) =>
              student.name.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
    }
    emit(HomeDataUpdated());
  }

  void generateCodes(S s) {
    final count = codeCountController.text.trim();
    if (count.isEmpty || int.tryParse(count) == null) {
      ToastManager.showError(s.errorTryAgain);
      return;
    }
    ToastManager.showSuccess(s.codesGeneratedSuccess);
    emit(HomeCodeGeneratedSuccess(s.codesGeneratedSuccess));
  }

  void addChapter(S s) {
    ToastManager.showSuccess(s.chapterAddedSuccess);
    emit(HomeChapterAddedSuccess(s.chapterAddedSuccess));
  }

  @override
  Future<void> close() {
    codeCountController.dispose();
    searchStudentController.dispose();
    return super.close();
  }
}
