import 'lecture_model.dart';

class ChapterModel {
  final String? refNo;
  final String name;
  final String description;
  final String grade;
  final int chapterOrder;
  final List<LectureModel> lectures;

  const ChapterModel({
    this.refNo,
    required this.name,
    required this.description,
    required this.grade,
    this.chapterOrder = 1,
    this.lectures = const [],
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    var rawLectures = json['lectures'] as List?;
    List<LectureModel> lecturesList = rawLectures != null
        ? rawLectures
            .map((e) => LectureModel.fromJson(e as Map<String, dynamic>))
            .toList()
        : [];

    return ChapterModel(
      refNo: json['refNo'] as String?,
      name: (json['name'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      grade: (json['grade'] ?? 'FIRST').toString(),
      chapterOrder: (json['chapterOrder'] ?? json['order'] ?? 1) as int,
      lectures: lecturesList,
    );
  }

  Map<String, dynamic> toJson() => {
        'refNo': refNo,
        'name': name,
        'description': description,
        'grade': grade,
        'chapterOrder': chapterOrder,
        'lectures': lectures.map((e) => e.toJson()).toList(),
      };
}
