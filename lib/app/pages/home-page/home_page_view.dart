import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/loading_overlay.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_four.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_one.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_three.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_two.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: transparentColor,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/icUser.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Get.toNamed(Routes.PROFILE_PAGE);
            },
          ),
          // actions: [
          //   IconButton(
          //     icon: SvgPicture.asset(
          //       iconChat,
          //       width: 24,
          //       height: 24,
          //       color: blackColor,
          //     ),
          //     onPressed: () {},
          //   ),
          // ],
        ),
        body: SingleChildScrollView(child: SafeArea(child: Obx(
          () {
            return LoadingOverlay(
                isLoading: controller.isLoading.value,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.015,
                    ),
                    child: Column(
                      children: [
                        HomePageComponentOne(),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        HomePageComponentTwo(),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        HomePageComponentThree(),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        HomePageComponentFour(),
                      ],
                    )));
          },
        ))));
  }
}
