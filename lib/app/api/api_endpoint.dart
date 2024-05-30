class ApiEndPoint {
  static String baseUrl = 'https://fun-education-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';
  static String baseUrlShiftMasuk = '$baseUrl/shift-masuk';
  static String baseUrlCatatanDarurat = '$baseUrl/catatan-darurat';
  static String baseUrlLaporanHarian = '$baseUrl/laporan-harian';
  static String baseUrlTabungan = '$baseUrl/tabungan';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth/register';
  static String logout = '$baseUrlAuth/logout';

  //Shift Masuk
  static String showCurrentShiftMasuk = '$baseUrlShiftMasuk/show-current';

  //User
  static String showCurrentUser = '$baseUrlAuth/show-current';

  //Catatan Darurat
  static String showLatestCatatanDarurat = '$baseUrlCatatanDarurat/show';

  //Laporan Harian
  static String showCurrentLaporanHarian = '$baseUrlLaporanHarian/show-current';

  //Tabungan
  static String showCurrentTabungan = '$baseUrlTabungan/show-current';
}