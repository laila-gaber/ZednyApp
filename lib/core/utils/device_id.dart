import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:zedny_app/core/components/misc.dart';

class DeviceId {
  static DeviceId instance = _init;

  static final DeviceId _init = DeviceId();
//
//   Future<String> getDeviceId() async {
//     String? deviceId;
//
//
//       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceId =   androidInfo.id;
//
//     return deviceId;
//       // return null;
//   }
// }

  Future<String> getDeviceId() async {
    String deviceId='';
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
       deviceId=   iosDeviceInfo.identifierForVendor.toString();
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId= androidDeviceInfo.id.toString(); // unique ID on Android
    }
    Misc.deviceId = deviceId;
    return deviceId;
  }

/*  static Future<void> setDeviceId() async {
    Misc.deviceId = await DeviceId().getDeviceId();
  }*/
}
