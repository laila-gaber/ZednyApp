import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/toast_manager.dart';
import '../../../../core/enums/grade_enum.dart';
import '../../../../core/utils/Utilities.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/chapter_model.dart';
import '../../data/models/code_type_enum.dart';
import '../../data/models/save_chapter_req_dto.dart';
import '../../data/models/save_lecture_req_dto.dart';
import '../../data/models/upload_lecture_image_req_dto.dart';
import '../../data/models/upload_video_req_dto.dart';
import '../../services/home_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;

  HomeCubit(this._homeService) : super(HomeInitial());

  final ImagePicker _picker = ImagePicker();

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

  XFile? pickedVideoFile;
  XFile? pickedImageFile;

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

    final request = SaveChapterReqDto(
      name: name,
      description: description,
      grade: selectedGrade.name,
      chapterOrder: order,
    );

    final result = await _homeService.saveChapter(request);

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

          chapters.add(savedChapter);
          emit(HomeSuccess(List.from(chapters)));

          fetchChaptersByGrade(grade: selectedGrade, s: s);
        }
      },
    );
  }

  Future<void> pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      pickedVideoFile = video;
      videoUrlController.text = video.path;
      emit(HomeFormUpdated());
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImageFile = image;
      emit(HomeFormUpdated());
    }
  }

  Future<void> submitSaveLecture({
    required String chapterRefNo,
    required S s,
  }) async {
    final name = lectureNameController.text.trim();
    final description = lectureDescController.text.trim();
    final orderText = lectureOrderController.text.trim();
    final order = int.tryParse(orderText) ?? 1;

    if (name.isEmpty) {
      ToastManager.showError(s.errorTryAgain);
      return;
    }

    emit(HomeLoading());

    String? base64Image;
    if (pickedImageFile != null) {
      final bytes = await pickedImageFile!.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    // Step 1: Save lecture (JSON payload) - video is NOT included here per contract
    final request = SaveLectureReqDto(
      chapterRefNo: chapterRefNo,
      name: name,
      description: description,
      videoUrl: '',
      order: order,
    );

    final result = await _homeService.saveLecture(request);

    if (isClosed) return;

    await result.fold(
      (error) async {
        if (!isClosed) {
          emit(HomeFailure(error.message ?? s.errorTryAgain));
        }
      },
      (savedLecture) async {
        // Upload image if present
        if (base64Image != null && savedLecture.refNo != null) {
          await _homeService.uploadLectureImage(
            UploadLectureImageReqDto(
              refNo: savedLecture.refNo!,
              imageData: base64Image,
            ),
          );
        }

        // Step 2: Upload video if picked (requires saved lecture refNo from Step 1)
        final videoFilePath =
            pickedVideoFile?.path ?? videoUrlController.text.trim();
        final hasVideoToUpload = pickedVideoFile != null ||
            (videoFilePath.isNotEmpty &&
                !videoFilePath.startsWith('http://') &&
                !videoFilePath.startsWith('https://'));

        if (hasVideoToUpload) {
          final lectureRefNo = savedLecture.refNo;
          if (lectureRefNo != null && lectureRefNo.isNotEmpty) {
            await _performVideoUpload(
              chapterRefNo: chapterRefNo,
              lectureRefNo: lectureRefNo,
              videoFilePath: videoFilePath,
              s: s,
            );
          } else {
            if (!isClosed) {
              emit(HomeFailure(s.errorTryAgain));
            }
          }
        } else {
          _onSaveLectureSuccess(s);
        }
      },
    );
  }

  Future<void> retryVideoUpload({
    required String chapterRefNo,
    required String lectureRefNo,
    required String videoFilePath,
    required S s,
  }) async {
    await _performVideoUpload(
      chapterRefNo: chapterRefNo,
      lectureRefNo: lectureRefNo,
      videoFilePath: videoFilePath,
      s: s,
    );
  }

  Future<void> _performVideoUpload({
    required String chapterRefNo,
    required String lectureRefNo,
    required String videoFilePath,
    required S s,
  }) async {
    emit(const HomeVideoUploadProgress(
      progress: 0.0,
      count: 0,
      total: 0,
    ));

    final uploadRequest = UploadVideoReqDto(
      chapterRefNo: chapterRefNo,
      refNo: lectureRefNo,
      videoFilePath: videoFilePath,
    );

    final uploadResult = await _homeService.uploadLectureVideo(
      request: uploadRequest,
      onSendProgress: (count, total) {
        if (!isClosed && total > 0) {
          final progress = count / total;
          emit(HomeVideoUploadProgress(
            progress: progress,
            count: count,
            total: total,
          ));
        }
      },
    );

    if (isClosed) return;

    uploadResult.fold(
      (error) {
        if (!isClosed) {
          emit(HomeVideoUploadFailure(
            message: error.message ?? s.errorTryAgain,
            chapterRefNo: chapterRefNo,
            lectureRefNo: lectureRefNo,
            videoFilePath: videoFilePath,
          ));
        }
      },
      (updatedLecture) {
        _onSaveLectureSuccess(s);
      },
    );
  }

  void _onSaveLectureSuccess(S s) {
    if (!isClosed) {
      ToastManager.showSuccess(s.codesGeneratedSuccess);
      lectureNameController.clear();
      lectureDescController.clear();
      videoUrlController.clear();
      lectureOrderController.text = '1';
      pickedImageFile = null;
      pickedVideoFile = null;
      emit(const HomeActionSuccess('Lecture saved successfully'));
      fetchChaptersByGrade(grade: selectedGrade, s: s);
    }
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
    lectureOrderController.dispose();
    return super.close();
  }
}
