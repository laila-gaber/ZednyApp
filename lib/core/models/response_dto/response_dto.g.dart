// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDto _$ResponseDtoFromJson(Map<String, dynamic> json) => ResponseDto(
  message: json['message'] as String?,
  status: json['status'] as bool,
  code: (json['code'] as num).toInt(),
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
  data: json['data'],
  date: json['date'] as String,
  currentPageNumber: (json['currentPageNumber'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  totalElements: (json['totalElements'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  hasNextPage: json['hasNextPage'] as bool?,
  hasPreviousPage: json['hasPreviousPage'] as bool?,
  firstPage: json['firstPage'] as bool?,
  lastPage: json['lastPage'] as bool?,
);

Map<String, dynamic> _$ResponseDtoToJson(ResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
      'date': instance.date,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'currentPageNumber': instance.currentPageNumber,
      'pageSize': instance.pageSize,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'firstPage': instance.firstPage,
      'lastPage': instance.lastPage,
    };
