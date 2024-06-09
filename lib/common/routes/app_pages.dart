import 'package:fun_education_app/app/global-component/navbar.dart';
import 'package:fun_education_app/app/pages/add-photo-page/add_photo_binding.dart';
import 'package:fun_education_app/app/pages/add-photo-page/add_photo_view.dart';
import 'package:fun_education_app/app/pages/detail-album-photo/detail_album_photo_binding.dart';
import 'package:fun_education_app/app/pages/detail-album-photo/detail_album_photo_view.dart';
import 'package:fun_education_app/app/pages/detail-laporan-bulanan-page/detail_laporan_bulanan_binding.dart';
import 'package:fun_education_app/app/pages/detail-laporan-bulanan-page/detail_laporan_bulanan_view.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_binding.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_view.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_binding.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_view.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_binding.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_binding.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_view.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_binding.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_view.dart';
import 'package:fun_education_app/app/pages/saving-information-page/saving_information_binding.dart';
import 'package:fun_education_app/app/pages/saving-information-page/saving_information_view.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_binding.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_view.dart';
import 'package:fun_education_app/app/pages/splash-screen/splash_screen_binding.dart';
import 'package:fun_education_app/app/pages/splash-screen/splash_screen_view.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/hal_yang_perlu_diperhatikan_binding.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/hal_yang_perlu_diperhatikan_view.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_binding.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_view.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_binding.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.NAVBAR,
      page: () => NavbarMain(),
      bindings: [
        HomePageBinding(),
        LaporanPageBinding(),
        SavingPageBinding(),
        GalleryPageBinding(),
        ProfilePageBinding(),
      ],
    ),
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
    GetPage(
      name: _Paths.SAVING_PAGE,
      page: () => SavingPageView(),
      binding: SavingPageBinding(),
    ),
    GetPage(
      name: _Paths.SAVING_INFORMATION_PAGE,
      page: () => SavingInformationView(),
      binding: SavingInformationBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PAGE,
      page: () => LaporanPageView(),
      binding: LaporanPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LAPORAN_HARIAN_PAGE,
      page: () => DetailLaporanHarianView(),
      binding: DetailLaporanHarianBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LAPORAN_BULANAN_PAGE,
      page: () => DetailLaporanBulananView(),
      binding: DetailLaporanBulananBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI_PAGE,
      page: () => TransaksiPageView(),
      binding: TransaksiPageBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY_PAGE,
      page: () => GalleryPageView(),
      binding: GalleryPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ALBUM_PHOTO,
      page: () => DetailAlbumPhotoView(),
      binding: DetailAlbumPhotoBinding(),
    ),
  ];
}
