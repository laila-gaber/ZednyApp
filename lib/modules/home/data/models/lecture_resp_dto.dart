import 'package:json_annotation/json_annotation.dart';

import '../../../../core/api/api_endpoints.dart';

part 'lecture_resp_dto.g.dart';

@JsonSerializable()
class LectureRespDto {
  final String? refNo;
  final String? chapterRefNo;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String description;
  final String? videoUrl;
  final String? imageUrl;
  @JsonKey(defaultValue: 1)
  final int lectureOrder;

  const LectureRespDto({
    this.refNo,
    this.chapterRefNo,
    this.name = '',
    this.description = '',
    this.videoUrl,
    this.imageUrl,
    this.lectureOrder = 1,
  });

  factory LectureRespDto.fromJson(Map<String, dynamic> json) =>
      _$LectureRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LectureRespDtoToJson(this);

  String? get fullImageUrl {
    if (imageUrl == null || imageUrl!.trim().isEmpty) return null;
    final sanitizedPath = imageUrl!.replaceAll('\\', '/');
    if (sanitizedPath.startsWith('http')) return sanitizedPath;
    return '${Endpoints.baseImageUrl}/$sanitizedPath';
  }
}

typedef LectureModel = LectureRespDto;
