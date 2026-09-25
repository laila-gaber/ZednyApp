// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_lecture_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveLectureReqDto _$SaveLectureReqDtoFromJson(Map<String, dynamic> json) =>
    SaveLectureReqDto(
      chapterRefNo: json['chapterRefNo'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      videoUrl: json['videoUrl'] as String,
      imageUrl: json['imageUrl'] as String? ?? '',
      order: (json['order'] as num).toInt(),
      price: (json['price'] as num?)?.toInt() ?? 0,
      free: json['free'] as bool? ?? true,
    );

Map<String, dynamic> _$SaveLectureReqDtoToJson(SaveLectureReqDto instance) =>
    <String, dynamic>{
      'chapterRefNo': instance.chapterRefNo,
      'name': instance.name,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'imageUrl': instance.imageUrl,
      'order': instance.order,
      'price': instance.price,
      'free': instance.free,
    };
