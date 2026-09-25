import 'package:flutter/material.dart';

enum GradeEnum {
  FIRST,
  SECOND,
  THIRD;


  String getLocalizedName(BuildContext context) {
    switch (this) {
      case GradeEnum.FIRST:
        return 'الصف الأول';
      case GradeEnum.SECOND:
        return 'الصف الثاني';
      case GradeEnum.THIRD:
        return 'الصف الثالث';
    }
  }
}
