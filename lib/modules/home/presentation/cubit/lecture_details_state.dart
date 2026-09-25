import '../../data/models/lecture_model.dart';

abstract class LectureDetailsState {
  const LectureDetailsState();
}

class LectureDetailsInitial extends LectureDetailsState {}

class LectureDetailsLoading extends LectureDetailsState {}

class LectureDetailsSuccess extends LectureDetailsState {
  final LectureModel lecture;
  final bool isVideoInitialized;
  final bool isPlaying;

  const LectureDetailsSuccess({
    required this.lecture,
    required this.isVideoInitialized,
    required this.isPlaying,
  });
}

class LectureDetailsFailure extends LectureDetailsState {
  final String message;
  const LectureDetailsFailure(this.message);
}
