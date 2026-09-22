class StudentModel {
  final String id;
  final String name;
  final String avatarInitial;
  final String grade;
  final int completedLectures;
  final int totalLectures;
  final bool isBlocked;
  final int warningsCount;

  const StudentModel({
    required this.id,
    required this.name,
    required this.avatarInitial,
    required this.grade,
    required this.completedLectures,
    required this.totalLectures,
    this.isBlocked = false,
    this.warningsCount = 0,
  });
}
