import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

enum UserTypeEnum { TEACHER, STUDENT, PARENT }

extension UserTypeEnumX on UserTypeEnum {
  String label(BuildContext context) {
    switch (this) {
      case UserTypeEnum.STUDENT:
        return S.of(context).student;
      case UserTypeEnum.TEACHER:
        return S.of(context).teacher;
      case UserTypeEnum.PARENT:
        return S.of(context).parent;
    }
  }

  IconData get icon {
    switch (this) {
      case UserTypeEnum.STUDENT:
        return Icons.school_outlined;
      case UserTypeEnum.TEACHER:
        return Icons.person_outline;
      case UserTypeEnum.PARENT:
        return Icons.family_restroom_outlined;
    }
  }
}
