
import '../extension/extensions.dart';

class Misc {

  static String deviceId='';
  static String version='1.0.0+1';

  static bool get isLoggedIn => sharedPrefs.getString("token") != null;
}
