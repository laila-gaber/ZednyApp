import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/api/api_endpoints.dart';
import '../../../../core/extension/extensions.dart';
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

  Map<String, String> _getAuthHeaders() {
    final Map<String, String> headers = {};
    final token = sharedPrefs.getString('token');
    final verification = sharedPrefs.getString('verification');

    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    if (verification != null && verification.isNotEmpty) {
      headers['Verification'] = verification;
    }
    headers['Accept-Language'] = 'ar';
    headers['X-API-Key'] = '9776f587-d9e3-40af-a6c2-8ffa3873e01c';

    return headers;
  }

  String _buildVideoUrl({
    required String? chapterRefNo,
    required String? refNo,
    required String rawVideoUrl,
  }) {
    final trimmed = rawVideoUrl.trim();

    // If it's already a complete HTTP/HTTPS URL containing /lectures/video/
    if ((trimmed.startsWith('http://') || trimmed.startsWith('https://')) &&
        trimmed.contains('/lectures/video/')) {
      return trimmed;
    }

    final normalized = trimmed.replaceAll('\\', '/');

    // If it's a relative path with /lectures/video/
    if (normalized.contains('/lectures/video/')) {
      final idx = normalized.indexOf('/lectures/video/');
      final path = normalized.substring(idx);
      return '${Endpoints.serverIP}$path';
    }

    // Split by '/' to extract chapterRefNo, refNo, and fileName from "VIDEOS/c698d.../d958.../1790...mp4"
    final parts = normalized.split('/').where((p) => p.isNotEmpty).toList();

    final String fileName = parts.isNotEmpty ? parts.last : '';
    String? extractedChapterRefNo = chapterRefNo;
    String? extractedRefNo = refNo;

    if (parts.length >= 3) {
      extractedRefNo = (extractedRefNo != null && extractedRefNo.isNotEmpty)
          ? extractedRefNo
          : parts[parts.length - 2];
      extractedChapterRefNo =
          (extractedChapterRefNo != null && extractedChapterRefNo.isNotEmpty)
              ? extractedChapterRefNo
              : parts[parts.length - 3];
    } else if (parts.length == 2) {
      extractedRefNo = (extractedRefNo != null && extractedRefNo.isNotEmpty)
          ? extractedRefNo
          : parts[parts.length - 2];
    }

    final cRef =
        (extractedChapterRefNo != null && extractedChapterRefNo.isNotEmpty)
            ? extractedChapterRefNo
            : 'default';
    final lRef = (extractedRefNo != null && extractedRefNo.isNotEmpty)
        ? extractedRefNo
        : 'default';

    return '${Endpoints.apiUrl}/lectures/video/$cRef/$lRef/$fileName';
  }

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
        final rawVideoUrl = data.videoUrl;

        if (rawVideoUrl != null && rawVideoUrl.trim().isNotEmpty) {
          final playbackUrl = _buildVideoUrl(
            chapterRefNo: data.chapterRefNo,
            refNo: data.refNo ?? refNo,
            rawVideoUrl: rawVideoUrl,
          );

          log('Playing video from URL: $playbackUrl');

          try {
            await videoController?.dispose();
            videoController = VideoPlayerController.networkUrl(
              Uri.parse(playbackUrl),
              httpHeaders: _getAuthHeaders(),
            );
            await videoController!.initialize();
            isVideoInitialized = true;
          } catch (e) {
            log('Video initialization error: $e');
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
