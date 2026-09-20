import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/extension/extensions.dart';
import 'core/utils/device_id.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();

  await DeviceId().getDeviceId();
  String lang = sharedPrefs.getString('lang') ?? 'ar';
  Locale locale = Locale(lang);
  runApp(MyApp(locale: locale));
}

