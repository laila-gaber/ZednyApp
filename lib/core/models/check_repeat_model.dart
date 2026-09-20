class CheckRepeatModel {
  final int page;
  final String? refNo;

  const CheckRepeatModel({required this.page,  this.refNo});

  // equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckRepeatModel && other.page == page && other.refNo == refNo;
  }

  // hashCode
  @override
  int get hashCode => Object.hash(page, refNo);

  // convenient copyWith
  CheckRepeatModel copyWith({int? page, String? refNo}) =>
      CheckRepeatModel(page: page ?? this.page, refNo: refNo ?? this.refNo);

  @override
  String toString() => 'MyModel(page: $page, refNo: $refNo)';
}
