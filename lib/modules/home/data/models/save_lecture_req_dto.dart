import 'package:json_annotation/json_annotation.dart';

part 'save_lecture_req_dto.g.dart';

@JsonSerializable()
class SaveLectureReqDto {
  final String chapterRefNo;
  final String name;
  final String description;
  final String videoUrl;
  final String imageUrl;
  final int order;
  final int price;
  final bool free;

  const SaveLectureReqDto({
    required this.chapterRefNo,
    required this.name,
    required this.description,
    required this.videoUrl,
    this.imageUrl = '',
    required this.order,
    this.price = 0,
    this.free = true,
  });

  factory SaveLectureReqDto.fromJson(Map<String, dynamic> json) =>
      _$SaveLectureReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SaveLectureReqDtoToJson(this);
}
