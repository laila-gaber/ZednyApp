import 'package:json_annotation/json_annotation.dart';

part 'save_chapter_req_dto.g.dart';

@JsonSerializable()
class SaveChapterReqDto {
  final String name;
  final String description;
  final String grade;
  final int chapterOrder;

  const SaveChapterReqDto({
    required this.name,
    required this.description,
    required this.grade,
    required this.chapterOrder,
  });

  factory SaveChapterReqDto.fromJson(Map<String, dynamic> json) =>
      _$SaveChapterReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SaveChapterReqDtoToJson(this);
}
