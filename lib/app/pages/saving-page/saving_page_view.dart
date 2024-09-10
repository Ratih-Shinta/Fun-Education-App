import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_one.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_two.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SavingPageView extends GetView<SavingPageController> {

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.09),
          child: Container(
            color: blackColor,
            padding: EdgeInsets.only(
                right: width * 0.05, top: height * 0.01, left: width * 0.02),
            child: AppBar(
              backgroundColor: blackColor,
              title: AutoSizeText('Tabungan Ananda',
                  style: tsTitleSmallSemibold(whiteColor)),
              actions: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SAVING_INFORMATION_PAGE);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.015,
                      horizontal: width * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.info_outline,
                      size: 24,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SmartRefresher(
          onRefresh: () async {
            await controller.showCurrentTabungan();
            await controller.showCurrentTransaksi();
            controller.refreshController.refreshCompleted();
          },
          controller: controller.refreshController,
          header: WaterDropHeader(
            complete: Text(
              'Refresh Completed',
              style: tsBodySmallRegular(blackColor),
            ),
            waterDropColor: primaryColor,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [SavingPageComponentOne(), SavingPageComponentTwo()],
            ),
          ),
        ));
  }
}
