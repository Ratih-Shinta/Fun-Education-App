class ApiEndPoint {
  static String baseUrl = 'https://fun-education-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';
  static String baseUrlShiftMasuk = '$baseUrl/shift-masuk';
  static String baseUrlCatatanDarurat = '$baseUrl/catatan-darurat';
  static String baseUrlLaporanHarian = '$baseUrl/laporan-harian';
  static String baseUrlTabungan = '$baseUrl/tabungan';
  static String baseUrlTransaksi = '$baseUrl/transaksi';
  static String baseUrlAlurBelajar = '$baseUrl/alur-belajar';
  static String baseUrlAllPhotos = '$baseUrl/gallery';
  static String baseUrlMinimumPengajuan = '$baseUrl/minimum-pengajuan';
  static String baseUrlPengajuanTabungan = '$baseUrl/pengajuan-tabungan';
  static String baseUrlAllAlbumPhotos = '$baseUrl/album';
  static String baseUrlTugas = '$baseUrl/tugas';
  static String baseUrlLeaderboard = '$baseUrl/leaderboard';
  static String baseUrlTugasUser = '$baseUrl/tugas-user';
  static String baseUrlTugasUserImage = '$baseUrl/tugas-user-image';
  static String baseUrlOTP = '$baseUrl/otp';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth/register';
  static String logout = '$baseUrlAuth/logout';

  //Statistic
  // static String showStatisticCurrentTugas = '$baseUrlTugasUser/statistic';
  // static String showStatisticCurrentLaporan = '$baseUrlLaporanHarian/statistic';
  static String showStatisticCurrentTugas = '$baseUrlTugasUser/statistic-new';
  static String showStatisticCurrentLaporan = '$baseUrlLaporanHarian/statistic-new';

  //OTP
  static String sendOTP = '$baseUrlOTP/store';
  static String checkOTP = '$baseUrlOTP/check';

  //Leaderboard
  static String showLeaderboard = '$baseUrlLeaderboard/index';
  static String showtotalPoint = '$baseUrlLeaderboard/point';

  //Tugas
  static String showCurrentTugas = '$baseUrlTugas/show-current';
  static String showByIdTugas = '$baseUrlTugas/show/';

  //Tugas User
  static String showCurrentTugasUser = '$baseUrlTugasUser/show-current/';
  static String storeKirimTugasUser = '$baseUrlTugasUser/store';
  static String storeKirimTugasUserImage = '$baseUrlTugasUserImage/store';

  //Shift Masuk
  static String showCurrentShiftMasuk = '$baseUrlShiftMasuk/show-current';

  //User
  static String showCurrentUser = '$baseUrlAuth/show-current';
  static String updateResetPassword = '$baseUrlAuth/reset-password';
  static String storeCheckEmail = '$baseUrlAuth/check-email';

  //Catatan Darurat
  static String showLatestCatatanDarurat = '$baseUrlCatatanDarurat/show';

  //Laporan Harian
  static String showCurrentLaporanHarian = '$baseUrlLaporanHarian/show-current';
  static String showCurrentPoint = '$baseUrlLaporanHarian/show-current-point';
  static String showCurrentAvailable = '$baseUrlLaporanHarian/show-available';

  //Tabungan
  static String showCurrentTabungan = '$baseUrlTabungan/show-current';

  //Transaksi
  static String showCurrentTransaksi = '$baseUrlTransaksi/show-current';

  //Alur Belajar
  static String showCurrentAlurBelajar = '$baseUrlAlurBelajar/show-current';

  //Show All Photos
  static String showAllPhotos = '$baseUrlAllPhotos/index';

  //Minimum Pengajuan
  static String showCurrentMinimumPengajuan =
      '$baseUrlMinimumPengajuan/show-current';

  //Pengajuan Tabungan
  static String storePengajuanTabungan = '$baseUrlPengajuanTabungan/store';
  static String currentPengajuanTabungan =
      '$baseUrlPengajuanTabungan/show-current';
  static String deletePengajuanTabungan = '$baseUrlPengajuanTabungan/delete/';

  //Show All Photos
  static String showAllAlbumPhotos = '$baseUrlAllAlbumPhotos/index';
}
