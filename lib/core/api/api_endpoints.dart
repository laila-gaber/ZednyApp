class Endpoints {
 static const serverIP = 'http://192.168.1.9:8085';

   static const testServerBaseUrl = '$serverIP/zedny_api/api/v1';

  static const testAdminApiUrl = '$testServerBaseUrl/api/v1/admin';
  static const baseImageUrl = '$serverIP/zedny_api/uploads';

  static const apiUrl = testServerBaseUrl;

  static String sendOtp = '$apiUrl/Auth/sendOtp';
  static String resendOtp = '$apiUrl/Auth/resendOtp';
  static String verifyOtp = '$apiUrl/Auth/Verification';
  static String loginWithPhone = '$apiUrl/users/login';
  static String registerWithPhone = '$apiUrl/users/login';
  static String getStudents = '$apiUrl/users/students';
  static String getProfile = '$apiUrl/users/profile';
  static String getChaptersByGrade = '$apiUrl/chapters/chaptersByGrade';
  static String getLectureByRefNo = '$apiUrl/lectures/byRefNo';
  static String saveChapter = '$apiUrl/chapters/saveChapter';
  static String saveLecture = '$apiUrl/lectures/save';
  static String uploadLectureImage = '$apiUrl/lectures/uploadImage';
}
