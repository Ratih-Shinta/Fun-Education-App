import 'package:fun_education_app/app/pages/add-photo-page/add_photo_binding.dart';
import 'package:fun_education_app/app/pages/add-photo-page/add_photo_view.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_binding.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_binding.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_view.dart';
import 'package:fun_education_app/app/pages/splash-screen/splash_screen_binding.dart';
import 'package:fun_education_app/app/pages/splash-screen/splash_screen_view.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/hal_yang_perlu_diperhatikan_binding.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/hal_yang_perlu_diperhatikan_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PHOTO_PAGE,
      page: () => AddPhotoView(),
      binding: AddPhotoBinding(),
    ),
    GetPage(
      name: _Paths.HAL_YANG_PERLU_DIPERHATIKAN_PAGE,
      page: () => HalYangPerluDiperhatikanView(),
      binding: HalYangPerluDiperhatikanBinding(),
    ),
  ];
}
