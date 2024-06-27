import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_view.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_view.dart';
import 'package:fun_education_app/app/pages/navbar/navbar_main_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_view.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class NavbarMainView extends StatelessWidget {
  final NavbarMainController controller = Get.put(NavbarMainController());

  final List<Widget> pages = [
    HomePageView(),
    LaporanPageView(),
    SavingPageView(),
    GalleryPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/icHome.svg'),
                activeIcon: SvgPicture.asset('assets/icons/icHome.svg',
                    color: primaryColor),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/icLaporan.svg'),
                activeIcon: SvgPicture.asset('assets/icons/icLaporan.svg',
                    color: primaryColor),
                label: 'Laporan',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/icTabungan.svg'),
                activeIcon: SvgPicture.asset('assets/icons/icTabungan.svg',
                    color: primaryColor),
                label: 'Tabungan',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/icGallery.svg'),
                activeIcon: SvgPicture.asset('assets/icons/icGallery.svg',
                    color: primaryColor),
                label: 'Gallery',
              ),
            ],
            backgroundColor: whiteColor,
            currentIndex: controller.selectedIndex.value,
            unselectedLabelStyle: tsLabelLargeMedium(greyColor),
            selectedLabelStyle: tsLabelLargeMedium(primaryColor),
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.selectedPage(index);
            },
          )),
    );
  }
}
