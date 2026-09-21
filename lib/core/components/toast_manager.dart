import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../network/error_handling.dart';
import '../values/my_colors.dart';

class ToastManager {
  static showError(String message,
      {Color? bgColor, Color? textColor, AppError? appError}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.red,
        textColor: MyColors.white,
        fontSize: 16.0
    );
  }

  static showSuccess(String title,
      {Color? bgColor, Color? textColor}) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.green,
        textColor: MyColors.white,
        fontSize: 16.0
    );
  }
}
