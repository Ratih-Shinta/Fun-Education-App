part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const NAVBAR = _Paths.NAVBAR;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const LOGIN_PAGE = _Paths.LOGIN_PAGE;
  static const ADD_PHOTO_PAGE = _Paths.ADD_PHOTO_PAGE;
  static const HAL_YANG_PERLU_DIPERHATIKAN_PAGE =
      _Paths.HAL_YANG_PERLU_DIPERHATIKAN_PAGE;
  static const SAVING_PAGE = _Paths.SAVING_PAGE;
  static const SAVING_INFORMATION_PAGE = _Paths.SAVING_INFORMATION_PAGE;
  static const LAPORAN_PAGE = _Paths.LAPORAN_PAGE;
  static const  DETAIL_LAPORAN_HARIAN_PAGE = _Paths.DETAIL_LAPORAN_HARIAN_PAGE;
  static const  DETAIL_LAPORAN_BULANAN_PAGE = _Paths.DETAIL_LAPORAN_BULANAN_PAGE;
  static const  PROFILE_PAGE = _Paths.PROFILE_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const NAVBAR = '/navbar';
  static const SPLASH_SCREEN = '/splash-screen';
  static const HOME_PAGE = '/home-page';
  static const LOGIN_PAGE = '/login';
  static const ADD_PHOTO_PAGE = '/add-photo-page';
  static const HAL_YANG_PERLU_DIPERHATIKAN_PAGE = '/hal-yang-perlu-diperhatikan-page';
  static const SAVING_PAGE = '/saving-page';
  static const SAVING_INFORMATION_PAGE = '/saving-information-page';
  static const LAPORAN_PAGE = '/laporan-page';
  static const DETAIL_LAPORAN_HARIAN_PAGE = '/detail-laporan-harian-page';
  static const DETAIL_LAPORAN_BULANAN_PAGE = '/detail-laporan-bulanan-page';
  static const PROFILE_PAGE = '/profile-page';
}
