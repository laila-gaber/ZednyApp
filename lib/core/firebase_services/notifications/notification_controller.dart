import 'dart:convert';

import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'dart:io';

import '../../extension/extensions.dart';
import '../../values/asstes.dart';

class NotificationsController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Future<void> initializeFirebase() async {
    // Request permission for iOS
    await _firebaseMessaging.requestPermission();
    // Get the FCM token
    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");
    sharedPrefs.setString('notifId', token!);

    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Message received: ${message.notification?.title}");
      print('Message data: ${message.data['notificationType']}');
      showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });

    // FirebaseMessaging.onBackgroundMessage((RemoteMessage message)async{
    //   print('Message clicked!');
    //
    // });


  }


  void initializeLocalNotifications() async {
    var androidInitialization = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: androidInitialization);
    await flutterLocalNotificationsPlugin.initialize(
        settings: initializationSettings,
      onDidReceiveNotificationResponse: onTapNotification,
      onDidReceiveBackgroundNotificationResponse: onTapNotification,
    );
  }


  Future<void> showNotification(RemoteMessage message) async {
    // Load app logo
    final ByteData data = await rootBundle.load(Assets.assetsImagesLogo);
    final Uint8List bytes = data.buffer.asUint8List();

    var androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      largeIcon: ByteArrayAndroidBitmap(bytes), // App logo as large icon
      styleInformation: DefaultStyleInformation(true, true), // Simple style
    );

    var generalNotificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: generalNotificationDetails,
      payload: json.encode(message.data['notificationType']),
    );
  }
  static  onTapNotification(NotificationResponse notificationResponse){
final String payload=notificationResponse.payload!.replaceAll('"', "");

   // if(payload==NotificationType.emailVerification.name&&sharedPrefs.getString('token')!=null){
   //   if(Get.currentRoute==Routes.PROFILE){
   //     Get.find<AuthController>().getProfile();
   //   }else {
   //     Get.find<AuthController>().getProfile();
   //
   //     Get.toNamed(Routes.PROFILE);
   //
   //   }

   // }

  }



}

