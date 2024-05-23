class ApiEndPoint {
  static String baseUrl = 'https://fun-education-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';
  static String baseUrlShiftMasuk = '$baseUrl/shift-masuk';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth/register';
  static String logout = '$baseUrlAuth/logout';

  //Shift Masuk
  static String showCurrentShiftMasuk = '$baseUrlShiftMasuk/show-current';

  //User
  static String showCurrentUser = '$baseUrlAuth/show-current';
}