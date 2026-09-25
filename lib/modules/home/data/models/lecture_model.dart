import '../../../../core/api/api_endpoints.dart';

class LectureModel {
  final String? refNo;
  final String name;
  final String description;
  final String? videoUrl;
  final String? imageUrl;
  final int lectureOrder;

  const LectureModel({
    this.refNo,
    required this.name,
    required this.description,
    this.videoUrl,
    this.imageUrl,
    this.lectureOrder = 1,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      refNo: json['refNo'] as String?,
      name: (json['name'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      videoUrl: json['videoUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      lectureOrder: (json['lectureOrder'] ?? json['order'] ?? 1) as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'refNo': refNo,
        'name': name,
        'description': description,
        'videoUrl': videoUrl,
        'imageUrl': imageUrl,
        'lectureOrder': lectureOrder,
      };

  String? get fullImageUrl {
    if (imageUrl == null || imageUrl!.trim().isEmpty) return null;
    final sanitizedPath = imageUrl!.replaceAll('\\', '/');
    if (sanitizedPath.startsWith('http')) return sanitizedPath;
    return '${Endpoints.baseImageUrl}/$sanitizedPath';
  }
}
