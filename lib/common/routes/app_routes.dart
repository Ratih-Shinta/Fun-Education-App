part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const LOGIN_PAGE  = _Paths.LOGIN_PAGE;
  static const ADD_PHOTO_PAGE  = _Paths.ADD_PHOTO_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_SCREEN = '/splash-screen';
  static const HOME_PAGE = '/home-page';
  static const LOGIN_PAGE = '/login';
  static const ADD_PHOTO_PAGE = '/add-photo-page';
}