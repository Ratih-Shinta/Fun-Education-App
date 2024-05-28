import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/components/bottomsheet_penjelasan_shift_masuk.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/widgets/user_data_container.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: AutoSizeText.rich(
            group: AutoSizeGroup(),
            maxLines: 1,
            TextSpan(
              text: 'Profil ',
              style: tsTitleSmallRegular(blackColor),
              children: [
                TextSpan(
                  text: 'Ananda',
                  style: tsTitleSmallSemibold(blackColor),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.04,
              ),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: width * 0.17,
                      backgroundColor: greyColor,
                    ),
                  ),
                  SizedBox(height: 31),
                  Obx(() => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.025,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return BottomsheetPenjelasanShiftMasuk();
                              },
                            );
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.02,
                                horizontal: height * 0.015),
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8.5),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.access_time_filled,
                                        color: primaryColor,
                                      ),
                                    ),
                                    AutoSizeText.rich(
                                        TextSpan(
                                          text: 'Shift Masuk\n',
                                          style: tsBodySmallRegular(whiteColor)
                                              .copyWith(
                                            height: 1.3,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${homePageController.shiftMasukModel.value.shiftMasuk}',
                                              style: tsBodyMediumSemibold(
                                                  whiteColor),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AutoSizeText.rich(
                                      textAlign: TextAlign.center,
                                      TextSpan(
                                          text: 'Lihat Penjelasan',
                                          style:
                                              tsLabelLargeRegular(whiteColor)),
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: whiteColor,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        UserDataContainer(
                            title: 'Nama Lengkap',
                            content: '${homePageController.showCurrentUserModel.value.namaLengkap}'),
                        SizedBox(height: height * 0.01),
                        UserDataContainer(
                            title: 'Tempat, Tanggal Lahir',
                            content: '${homePageController.showCurrentUserModel.value.tempatTanggalLahir}'),
                        SizedBox(height: height * 0.01),
                        UserDataContainer(
                            title: 'Alamat',
                            content: '${homePageController.showCurrentUserModel.value.alamat}'),
                        SizedBox(height: height * 0.02),
                        ElevatedButton(
                            onPressed: () => controller.logout(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Logout",
                                    style: tsBodyMediumMedium(whiteColor)),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),)
                ],
              ),
            ),
          ),
        ));
  }
}
