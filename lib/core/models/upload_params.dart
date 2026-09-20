import 'dart:convert';

class UploadParams {
  late String refNo;
  late String imageData;
  late int count;
  late String initials;
  late bool hasThumb = false;
  String? name;
  UploadParams({
    required this.refNo,
    required this.imageData,
    required this.count,
    required this.initials,
    required this.hasThumb,
    this.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UploadParams &&
        other.refNo == refNo &&
        other.imageData == imageData &&
        other.count == count &&
        other.initials == initials &&
        other.hasThumb == hasThumb;
  }

  @override
  int get hashCode {
    return refNo.hashCode ^
        imageData.hashCode ^
        count.hashCode ^
        initials.hashCode ^
        hasThumb.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'refNo': refNo});
    result.addAll({'imageData': imageData});
    result.addAll({'count': count});
    result.addAll({'initials': initials});
    result.addAll({'hasThumb': hasThumb});
    result.addAll({'name': name});

    return result;
  }

  String toJson() => json.encode(toMap());
}
