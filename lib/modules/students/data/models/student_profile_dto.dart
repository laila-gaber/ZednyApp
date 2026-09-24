class StudentProfileDto {
  final String? refNo;
  final String? name;
  final String? phone;
  final String? parentPhone;
  final String? image;
  final String? profileType;
  final String? grade;

  StudentProfileDto({
    this.refNo,
    this.name,
    this.phone,
    this.parentPhone,
    this.image,
    this.profileType,
    this.grade,
  });

  factory StudentProfileDto.fromJson(Map<String, dynamic> json) {
    return StudentProfileDto(
      refNo: json['refNo'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      parentPhone: json['parentPhone'] as String?,
      image: json['image'] as String?,
      profileType: json['profileType'] as String?,
      grade: json['grade'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'refNo': refNo,
        'name': name,
        'phone': phone,
        'parentPhone': parentPhone,
        'image': image,
        'profileType': profileType,
        'grade': grade,
      };
}
