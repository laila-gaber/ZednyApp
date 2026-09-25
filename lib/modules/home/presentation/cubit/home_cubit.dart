import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/toast_manager.dart';
import '../../../../core/enums/grade_enum.dart';
import '../../../../core/utils/Utilities.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/chapter_model.dart';
import '../../data/models/code_type_enum.dart';
import '../../services/home_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;

  HomeCubit(this._homeService) : super(HomeInitial());

  // Bottom Navigation State
  int currentTabIndex = 0;

  // Profile & Permissions State
  Profile? currentUser;

  // Grade Filter State
  GradeEnum selectedGrade = GradeEnum.FIRST;

  // Content List State
  List<ChapterModel> chapters = [];

  // Codes Tab State
  CodeTypeEnum selectedCodeType = CodeTypeEnum.lecture;
  String? selectedLecture;
  final TextEditingController codeCountController =
      TextEditingController(text: '5');
  final List<String> lectureList = const [
    'المحاضرة الأولى - المقدمات',
    'المحاضرة الثانية - المفاهيم',
    'المحاضرة الثالثة - التطبيقات',
  ];

  // Chapter Form Controllers
  final TextEditingController chapterNameController = TextEditingController();
  final TextEditingController chapterDescController = TextEditingController();
  final TextEditingController chapterOrderController =
      TextEditingController(text: '1');

  // Lecture Form Controllers
  final TextEditingController lectureNameController = TextEditingController();
  final TextEditingController lectureDescController = TextEditingController();
  final TextEditingController videoUrlController = TextEditingController();
  final TextEditingController lectureOrderController =
      TextEditingController(text: '1');
  String? selectedLectureBase64Image;

  void initData(S s) {
    currentUser = Utilities.getCurrentUser();
    fetchProfile(s);
    fetchChaptersByGrade(grade: selectedGrade, s: s);
  }

  void changeTab(int index) {
    currentTabIndex = index;
    emit(HomeTabChanged(currentTabIndex));
  }

  Future<void> fetchProfile(S s) async {
    final result = await _homeService.getProfile();
    if (isClosed) return;

    result.fold(
      (error) {},
      (profile) {
        if (!isClosed) {
          currentUser = profile;
          emit(HomeFormUpdated());
        }
      },
    );
  }

  void changeGrade(GradeEnum grade, S s) {
    selectedGrade = grade;
    fetchChaptersByGrade(grade: grade, s: s);
  }

  Future<void> fetchChaptersByGrade({GradeEnum? grade, S? s}) async {
    final targetGrade = grade ?? selectedGrade;
    emit(HomeLoading());

    final result = await _homeService.getChaptersByGrade(targetGrade.name);
    if (isClosed) return;

    result.fold(
      (error) {
        if (!isClosed) {
          emit(HomeFailure(error.message ?? s?.errorTryAgain ?? 'Error'));
        }
      },
      (data) {
        if (!isClosed) {
          chapters = data;
          emit(HomeSuccess(chapters));
        }
      },
    );
  }

  Future<void> submitSaveChapter(S s) async {
    final name = chapterNameController.text.trim();
    final description = chapterDescController.text.trim();
    final orderText = chapterOrderController.text.trim();
    final order = int.tryParse(orderText) ?? 1;

    if (name.isEmpty) {
      ToastManager.showError(s.errorTryAgain);
      return;
    }

    emit(HomeLoading());

    final result = await _homeService.saveChapter(
      name: name,
      description: description,
      grade: selectedGrade.name,
      order: order,
    );

    if (isClosed) return;

    result.fold(
      (error) {
        if (!isClosed) {
          emit(HomeFailure(error.message ?? s.errorTryAgain));
        }
      },
      (savedChapter) {
        if (!isClosed) {
          ToastManager.showSuccess(s.chapterAddedSuccess);
          chapterNameController.clear();
          chapterDescController.clear();
          chapterOrderController.text = '1';
          fetchChaptersByGrade(grade: selectedGrade, s: s);
        }
      },
    );
  }

  Future<void> submitSaveLecture({
    required String chapterRefNo,
    required S s,
  }) async {
    final name = lectureNameController.text.trim();
    final description = lectureDescController.text.trim();
    final videoUrl = videoUrlController.text.trim();
    final orderText = lectureOrderController.text.trim();
    final order = int.tryParse(orderText) ?? 1;

    if (name.isEmpty) {
      ToastManager.showError(s.errorTryAgain);
      return;
    }

    emit(HomeLoading());

    final result = await _homeService.saveLecture(
      chapterRefNo: chapterRefNo,
      name: name,
      description: description,
      videoUrl: videoUrl,
      order: order,
    );

    if (isClosed) return;

    await result.fold(
      (error) async {
        if (!isClosed) {
          emit(HomeFailure(error.message ?? s.errorTryAgain));
        }
      },
      (savedLecture) async {
        if (selectedLectureBase64Image != null &&
            savedLecture.refNo != null) {
          await _homeService.uploadLectureImage(
            refNo: savedLecture.refNo!,
            base64ImageData: selectedLectureBase64Image!,
          );
        }

        if (!isClosed) {
          ToastManager.showSuccess(s.codesGeneratedSuccess);
          lectureNameController.clear();
          lectureDescController.clear();
          videoUrlController.clear();
          lectureOrderController.text = '1';
          selectedLectureBase64Image = null;
          fetchChaptersByGrade(grade: selectedGrade, s: s);
        }
      },
    );
  }

  void changeCodeType(CodeTypeEnum type) {
    selectedCodeType = type;
    emit(HomeFormUpdated());
  }

  void selectLecture(String? lecture) {
    selectedLecture = lecture;
    emit(HomeFormUpdated());
  }

  void generateCodes(S s) {
    final count = codeCountController.text.trim();
    if (count.isEmpty || int.tryParse(count) == null) {
      ToastManager.showError(s.errorTryAgain);
      return;
    }
    ToastManager.showSuccess(s.codesGeneratedSuccess);
    emit(const HomeActionSuccess('Codes generated'));
  }

  @override
  Future<void> close() {
    codeCountController.dispose();
    chapterNameController.dispose();
    chapterDescController.dispose();
    chapterOrderController.dispose();
    lectureNameController.dispose();
    lectureDescController.dispose();
    videoUrlController.dispose();
    return super.close();
  }
}
