part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const NAVBAR = _Paths.NAVBAR;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const REGISTER_PAGE = _Paths.REGISTER_PAGE;
  static const PASSWORD_PAGE = _Paths.PASSWORD_PAGE;
  static const VERIFICATION_PAGE = _Paths.VERIFICATION_PAGE;
  static const PENDING_PAGE = _Paths.PENDING_PAGE;
  static const LOGIN_PAGE = _Paths.LOGIN_PAGE;
  static const RESET_PASSWORD_PAGE = _Paths.RESET_PASSWORD_PAGE;
  static const EMAIL_RESET_PASSWORD_PAGE = _Paths.EMAIL_RESET_PASSWORD_PAGE;
  static const ADD_PHOTO_PAGE = _Paths.ADD_PHOTO_PAGE;
  static const HAL_YANG_PERLU_DIPERHATIKAN_PAGE =
      _Paths.HAL_YANG_PERLU_DIPERHATIKAN_PAGE;
  static const SAVING_PAGE = _Paths.SAVING_PAGE;
  static const SAVING_INFORMATION_PAGE = _Paths.SAVING_INFORMATION_PAGE;
  static const LAPORAN_PAGE = _Paths.LAPORAN_PAGE;
  static const DETAIL_LAPORAN_HARIAN_PAGE = _Paths.DETAIL_LAPORAN_HARIAN_PAGE;
  static const PROFILE_PAGE = _Paths.PROFILE_PAGE;
  static const TRANSAKSI_PAGE = _Paths.TRANSAKSI_PAGE;
  static const GALLERY_PAGE = _Paths.GALLERY_PAGE;
  static const DETAIL_ALBUM_PHOTO = _Paths.DETAIL_ALBUM_PHOTO;
  static const DETAIL_TUGAS_PAGE = _Paths.DETAIL_TUGAS_PAGE;
  static const REPORT_HISTORY_PAGE = _Paths.REPORT_HISTORY_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const NAVBAR = '/navbar';
  static const SPLASH_SCREEN = '/splash-screen';
  static const HOME_PAGE = '/home-page';
  static const REGISTER_PAGE = '/register';
  static const PASSWORD_PAGE = '/password';
  static const VERIFICATION_PAGE = '/verification-page';
  static const PENDING_PAGE = '/pending-page';
  static const LOGIN_PAGE = '/login';
  static const RESET_PASSWORD_PAGE = '/reset-password-page';
  static const EMAIL_RESET_PASSWORD_PAGE = '/email-reset-password-page';
  static const ADD_PHOTO_PAGE = '/add-photo-page';
  static const HAL_YANG_PERLU_DIPERHATIKAN_PAGE =
      '/hal-yang-perlu-diperhatikan-page';
  static const SAVING_PAGE = '/saving-page';
  static const SAVING_INFORMATION_PAGE = '/saving-information-page';
  static const LAPORAN_PAGE = '/laporan-page';
  static const DETAIL_LAPORAN_HARIAN_PAGE = '/detail-laporan-harian-page';
  static const PROFILE_PAGE = '/profile-page';
  static const TRANSAKSI_PAGE = '/transaksi-page';
  static const GALLERY_PAGE = '/gallery-page';
  static const DETAIL_ALBUM_PHOTO = '/detail-album-photo';
  static const DETAIL_TUGAS_PAGE = '/detail-tugas-page';
  static const REPORT_HISTORY_PAGE = '/report-history-page';
}
