// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_lecture_image_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadLectureImageReqDto _$UploadLectureImageReqDtoFromJson(
  Map<String, dynamic> json,
) => UploadLectureImageReqDto(
  refNo: json['refNo'] as String,
  imageData: json['imageData'] as String,
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UploadLectureImageReqDtoToJson(
  UploadLectureImageReqDto instance,
) => <String, dynamic>{
  'refNo': instance.refNo,
  'imageData': instance.imageData,
  'count': instance.count,
};
