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
