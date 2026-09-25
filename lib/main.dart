import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/extension/extensions.dart';
import 'core/firebase_services/notifications/notification_controller.dart';
import 'core/utils/device_id.dart';
import 'firebase_options.dart';
import 'my_app.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await notificationsController.showNotification(message);

  if (message.data['payload'] != null) {
    log(message.data.toString());
  }
  if (kDebugMode) {
    log("Handling a background message: ${message.messageId}");
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
NotificationsController notificationsController = NotificationsController();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationsController().initializeFirebase();
  NotificationsController().initializeLocalNotifications();
  await DeviceId().getDeviceId();
  String lang = /*sharedPrefs.getString('lang') ??*/ 'ar';
  Locale locale = Locale(lang);
  log("token:\n ${sharedPrefs.getString("token")}");
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor:  Color(0xFFF4F8FB),
  ));
  runApp(MyApp(locale: locale));
}

