import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../generated/l10n.dart';

import '../../data/models/lecture_model.dart';
import '../../services/home_service.dart';
import 'lecture_details_state.dart';

class LectureDetailsCubit extends Cubit<LectureDetailsState> {
  final HomeService _homeService;

  LectureDetailsCubit(this._homeService) : super(LectureDetailsInitial());

  VideoPlayerController? videoController;
  LectureModel? lecture;
  bool isVideoInitialized = false;
  bool isPlaying = false;

  Future<void> fetchLectureDetails({
    required String refNo,
    required S s,
  }) async {
    if (state is LectureDetailsLoading) return;
    emit(LectureDetailsLoading());

    final result = await _homeService.getLectureByRefNo(refNo);
    if (isClosed) return;

    await result.fold(
      (error) async {
        if (!isClosed) {
          emit(LectureDetailsFailure(
            error.message ?? s.failedToLoadLecture,
          ));
        }
      },
      (data) async {
        lecture = data;
        final url = data.videoUrl;

        if (url != null &&
            url.isNotEmpty &&
            (url.startsWith('http://') || url.startsWith('https://'))) {
          try {
            await videoController?.dispose();
            videoController = VideoPlayerController.networkUrl(Uri.parse(url));
            await videoController!.initialize();
            isVideoInitialized = true;
          } catch (_) {
            isVideoInitialized = false;
          }
        } else {
          isVideoInitialized = false;
        }

        if (!isClosed) {
          emit(LectureDetailsSuccess(
            lecture: lecture!,
            isVideoInitialized: isVideoInitialized,
            isPlaying: isPlaying,
          ));
        }
      },
    );
  }

  void togglePlayPause() {
    if (videoController == null || !isVideoInitialized) return;

    if (videoController!.value.isPlaying) {
      videoController!.pause();
      isPlaying = false;
    } else {
      videoController!.play();
      isPlaying = true;
    }

    if (!isClosed && lecture != null) {
      emit(LectureDetailsSuccess(
        lecture: lecture!,
        isVideoInitialized: isVideoInitialized,
        isPlaying: isPlaying,
      ));
    }
  }

  @override
  Future<void> close() {
    videoController?.dispose();
    return super.close();
  }
}
