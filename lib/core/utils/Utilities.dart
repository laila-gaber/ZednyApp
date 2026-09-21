import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:animate_do/animate_do.dart';
import '../../generated/l10n.dart';
import '../api/api_endpoints.dart';
import '../routes/app_routes.dart';
import '../values/my_colors.dart';
import '../extension/extensions.dart';

class Profile {
  String? imgUrl;
  Profile({this.imgUrl});
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(imgUrl: json['imgUrl']);
  }
}

class Utilities {
 static Future<String> convertImageToBase64(url)async{
    var byteData=(await NetworkAssetBundle(Uri.parse(url))
        .load(url))
        .buffer
    .asUint8List();
     return   base64.encode(byteData);
  }

 static Profile? getCurrentUser() {
   try {
     final prof = sharedPrefs.getString("profile");
     if (prof == null) return null;
     var profile = Profile.fromJson(json.decode(prof));
       profile.imgUrl="${Endpoints.baseImageUrl}/${profile.imgUrl??""}";

     return profile;
   } on Exception {
     return null;
   }
 }

  static T enumFromString<T>(
      {required Iterable<T> values, required String? enumName}) {
    return values.firstWhere((element) =>
    element.toString().split('.').last.toLowerCase() ==
        (enumName ?? 'na').toLowerCase());
  }
  static String convertToEnNumbers(String? arNum) {
    if (arNum != null) {
      final araNums = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

      String newNum = '';
      for (String str in arNum.characters) {
        if (araNums.contains(str)) {
          newNum += araNums.indexOf(str).toString();
        } else {
          newNum += str;
        }
      }
      return newNum;
    }
    return arNum!;
  }

  static String phoneTrimer({required String oldPhone, required String code}) {
    String newPhone = code + oldPhone;
    return newPhone;
  }
  static Map<String, String> encodeModel(Map<String, dynamic> modelJson) {
    final sanitizedJson = modelJson.map((key, value) {
      return MapEntry(key, value?.toString() ?? '');
    });
    final params = sanitizedJson.toBase64();
    return {'params': params};
  }

  static bool isValidUrl(String url) {
    final urlPattern = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';
    final result = RegExp(urlPattern).hasMatch(url);
    return result;
  }

  static Future<void> launchAUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch url';
    }
  }
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
  static Future<void> sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Support Request from Halal App&body=As-salamu alaykum,',
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $email';
    }
  }

  static Future<void> openWhatsApp(String phoneNumber) async {
    String formattedNumber = phoneNumber.replaceAll('+', '');
    final Uri launchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: formattedNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  static Future<void> openMap() async {
    final Uri launchUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: 'maps/search/halal+stores+near+me',
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not open maps';
    }
  }
}
void showLoginRequiredPopup(BuildContext context,
    {String? featureName}) {
  featureName ??= S.of(context).thisFeature;
  showDialog(
    context: context,
    barrierColor: MyColors.black.withOpacity(0.5),
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: MyColors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: MyColors.black.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            MyColors.primary.withOpacity(0.1),
                            MyColors.primary.withOpacity(0.2),
                          ],
                        ),
                      ),
                      child: ShakeX(
                        infinite: true,
                        child: const Center(
                          child: Icon(
                            Icons.lock_outline,
                            size: 40,
                            color: MyColors.primary,
                          ),
                        ),
                      ),
                    ),
                    20.0.sbh,
                    Text(
                      S.of(context).loginRequired,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                    ),
                    12.0.sbh,
                    Text(
                      "$featureName ${S.of(context).requiresLogin}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.myGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                        ),
                        child: Text(
                          S.of(context).login,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: MyColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    16.0.sbh,
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        S.of(context).later,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: MyColors.myGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
