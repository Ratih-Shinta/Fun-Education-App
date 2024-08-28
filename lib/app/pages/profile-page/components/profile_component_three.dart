import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/widgets/user_data_container.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ProfileComponentThree extends GetView<ProfilePageController> {
  ProfileComponentThree({super.key});
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.info_outline_rounded),
            SizedBox(width: width * 0.02),
            AutoSizeText.rich(
              TextSpan(
                text: 'Informasi Umum',
                style: tsBodyMediumSemibold(blackColor),
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Obx(
          () => Column(
            children: [
              SizedBox(height: height * 0.02),
              UserDataContainer(
                  title: 'Jenis Kelamin',
                  content:
                      '${homePageController.showCurrentUserModel.value.gender}'),
              SizedBox(height: height * 0.01),
              UserDataContainer(
                  title: 'Tempat, Tanggal Lahir',
                  content:
                      '${homePageController.showCurrentUserModel.value.birth}'),
              SizedBox(height: height * 0.01),
              UserDataContainer(
                  title: 'Alamat',
                  content:
                      '${homePageController.showCurrentUserModel.value.address}'),
              SizedBox(height: height * 0.02),
              CommonButton(
                // isLoading: controller.isLoading.value,
                text: 'Logout',
                backgroundColor: dangerColor,
                textColor: whiteColor,
                svgIcon: 'assets/icons/icLogout.svg',
                onPressed: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
