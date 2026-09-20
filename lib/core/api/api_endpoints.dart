class Endpoints {
 static const serverIP = 'http://192.168.1.9:8085';

   static const testServerBaseUrl = '$serverIP/zedny_api/api/v1';

  static const testAdminApiUrl = '$testServerBaseUrl/api/v1/admin';
  static const baseImageUrl = '$serverIP/zedny_api/uploads';

  static const apiUrl = testServerBaseUrl;
  //    testServerBaseUrl;


//
  static String postDriverLocation = '$apiUrl/driver/changeLocation';
  static String validateRequest = '$apiUrl/user/validateRequest';
  static String registerWithPhone = '$apiUrl/users/registerAsStore';
  static String loginWithPhone = '$apiUrl/user/loginWithPhone';
  static String forgetPassword = '$apiUrl/users/forgetPassword';
  static String changePhone = '$apiUrl/users/changePhone';

  static String changeName = '$apiUrl/users/changeName';
 }
