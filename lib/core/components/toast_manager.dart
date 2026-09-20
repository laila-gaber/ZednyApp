import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../network/error_handling.dart';

class ToastManager {
  static  showError(String message,
      {Color? bgColor, Color? textColor, AppError? appError}) {
    /*if (appError == AppError.BadRequest ) {
      return;
    } else */
    {
     return Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    // return  Get.snackbar(title, text,
    //       colorText: textColor ?? Colors.white,
    //       backgroundColor: bgColor ?? Colors.red,
    //       messageText: Text(text,
    //           style: Theme.of(Get.context!)
    //               .textTheme
    //               .labelLarge!
    //               .copyWith(color: Colors.white)),
    //       snackPosition: SnackPosition.BOTTOM,);
    }
  }

  static showSuccess(String title,
      {Color? bgColor, Color? textColor}) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
