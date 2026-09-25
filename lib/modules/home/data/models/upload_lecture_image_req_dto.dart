import 'package:json_annotation/json_annotation.dart';

part 'upload_lecture_image_req_dto.g.dart';

@JsonSerializable()
class UploadLectureImageReqDto {
  final String refNo;
  final String imageData;
  final int count;

  const UploadLectureImageReqDto({
    required this.refNo,
    required this.imageData,
    this.count = 0,
  });

  factory UploadLectureImageReqDto.fromJson(Map<String, dynamic> json) =>
      _$UploadLectureImageReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UploadLectureImageReqDtoToJson(this);
}
