import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as time_ago;


extension ExtBox on num {
  SizedBox get sbh => SizedBox(height: toDouble());

  SizedBox get sbw => SizedBox(width: toDouble());
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  get countryCodeToEmoji {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  get_timeAgo(String languageCode) {
    DateTime dateTime = DateTime.parse(toString());
    String difference = time_ago.format(
      dateTime,
      locale: languageCode,
    );
    return difference;
  }

  mapFromBase64() {
    try {
      final bytes = base64.decode(this);

      // Step 2: Convert the bytes to a string
      String jsonString = utf8.decode(bytes);

      // Step 3: Parse the string to JSON
      Map<String, dynamic> json = jsonDecode(jsonString);

      return json; // Output the decoded JSON
    } catch (error) {
      log('Error decoding JSON: $error');
      //  Get.toNamed(Routes.urlNavError);
      return null; // or handle the error as per your requirement
    }
  }
}

extension ColorExtensions on Color {
  toRGBValue() {
    var hexColor = toString().replaceAll("Color(0xff", ")").replaceAll(')', '');
    return hexColor;
  }

  myOpacity(double opacity) {
    return withAlpha ((opacity * 255).toInt());
  }
}

extension MapExtensions on Map<String, dynamic> {
  toBase64() {
    try {
      // Step 1: Convert the map to a JSON string
      String jsonString = json.encode(this);

      // Step 2: Convert the JSON string to bytes
      List<int> bytes = utf8.encode(jsonString);

      // Step 3: Encode the bytes to Base64
      String base64String = base64.encode(bytes);

      return base64String;
    } catch (error) {
      log('Error decoding JSON: $error');
      // Get.toNamed(RouteNames.urlNavError);
      return null; // or handle the error as per your requirement
    }
  }
}

late final SharedPreferences sharedPrefs;
