import '../../data/models/chapter_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ChapterModel> chapters;
  const HomeSuccess(this.chapters);
}

class HomeFailure extends HomeState {
  final String message;
  const HomeFailure(this.message);
}

class HomeTabChanged extends HomeState {
  final int tabIndex;
  const HomeTabChanged(this.tabIndex);
}

class HomeFormUpdated extends HomeState {}

class HomeActionSuccess extends HomeState {
  final String message;
  const HomeActionSuccess(this.message);
}

class HomeVideoUploadProgress extends HomeState {
  final double progress;
  final int count;
  final int total;

  const HomeVideoUploadProgress({
    required this.progress,
    required this.count,
    required this.total,
  });
}

class HomeVideoUploadFailure extends HomeState {
  final String message;
  final String chapterRefNo;
  final String lectureRefNo;
  final String videoFilePath;

  const HomeVideoUploadFailure({
    required this.message,
    required this.chapterRefNo,
    required this.lectureRefNo,
    required this.videoFilePath,
  });
}
