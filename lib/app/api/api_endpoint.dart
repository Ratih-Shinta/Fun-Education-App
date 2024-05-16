class ApiEndPoint {
  static String baseUrl = 'https://fun-education-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth/register';
  static String logout = '$baseUrlAuth/logout';
}