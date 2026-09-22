import '../../data/models/code_type_enum.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeTabChanged extends HomeState {
  final int tabIndex;
  const HomeTabChanged(this.tabIndex);
}

class HomeDataUpdated extends HomeState {}

class HomeCodeGeneratedSuccess extends HomeState {
  final String message;
  const HomeCodeGeneratedSuccess(this.message);
}

class HomeChapterAddedSuccess extends HomeState {
  final String message;
  const HomeChapterAddedSuccess(this.message);
}
