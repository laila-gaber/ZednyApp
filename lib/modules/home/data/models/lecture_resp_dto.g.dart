// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureRespDto _$LectureRespDtoFromJson(Map<String, dynamic> json) =>
    LectureRespDto(
      refNo: json['refNo'] as String?,
      chapterRefNo: json['chapterRefNo'] as String?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      videoUrl: json['videoUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      lectureOrder: (json['lectureOrder'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$LectureRespDtoToJson(LectureRespDto instance) =>
    <String, dynamic>{
      'refNo': instance.refNo,
      'chapterRefNo': instance.chapterRefNo,
      'name': instance.name,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'imageUrl': instance.imageUrl,
      'lectureOrder': instance.lectureOrder,
    };
