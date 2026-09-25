// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_chapter_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveChapterReqDto _$SaveChapterReqDtoFromJson(Map<String, dynamic> json) =>
    SaveChapterReqDto(
      name: json['name'] as String,
      description: json['description'] as String,
      grade: json['grade'] as String,
      chapterOrder: (json['chapterOrder'] as num).toInt(),
    );

Map<String, dynamic> _$SaveChapterReqDtoToJson(SaveChapterReqDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'grade': instance.grade,
      'chapterOrder': instance.chapterOrder,
    };
