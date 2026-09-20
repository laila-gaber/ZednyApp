// import 'package:json_annotation/json_annotation.dart';
//
// part 'response_dto.g.dart';
//
// @JsonSerializable()
// class ResponseDto {
//   String? message;
//   bool status;
//   int code;
//   dynamic data;
//   String date;
//
//   ResponseDto({
//     this.message,
//     required this.status,
//     required this.code,
//     this.data,
//     required this.date,
//   });
//
//   factory ResponseDto.fromJson(Map<String, dynamic> json) {
//     return _$ResponseDtoFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() => _$ResponseDtoToJson(this);
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//
//     return other is ResponseDto &&
//         other.message == message &&
//         other.status == status &&
//         other.code == code &&
//         other.data == data &&
//         other.date == date;
//   }
//
//   @override
//   int get hashCode {
//     return message.hashCode ^
//         status.hashCode ^
//         code.hashCode ^
//         data.hashCode ^
//         date.hashCode;
//   }
// }
import 'package:json_annotation/json_annotation.dart';

part 'response_dto.g.dart';

@JsonSerializable()
class ResponseDto {
  String? message;
  bool status;
  int code;
  dynamic data;
  String date;
  String? accessToken;
  String? refreshToken;
  int? currentPageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;
  final bool? hasNextPage;
  final bool? hasPreviousPage;
  final bool? firstPage;
  final bool? lastPage;

  ResponseDto(
      {
        this.message,
        required this.status,
        required this.code,
        this.accessToken,
        this.refreshToken,
        this.data,
        required this.date,
        this.currentPageNumber,
        this.pageSize,
        this.totalElements,
        this.totalPages,
        this.hasNextPage,
        this.hasPreviousPage,
        this.firstPage,
        this.lastPage,

      });

  factory ResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseDtoToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseDto &&
        other.message == message &&
        other.status == status &&
        other.code == code &&
        other.data == data &&
        other.date == date;
  }

  @override
  int get hashCode {
    return message.hashCode ^
    status.hashCode ^
    code.hashCode ^
    data.hashCode ^
    date.hashCode;
  }
}
