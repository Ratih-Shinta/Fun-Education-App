import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/components/bottomsheet_penjelasan_shift_masuk.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/widgets/user_data_container.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProfilePageView extends StatelessWidget {
  final HomePageController homePageController = HomePageController();

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
      body: SafeArea(
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
              Container(
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
                        margin: EdgeInsets.symmetric(vertical: height * 0.01),
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
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.access_time_filled,
                                    color: primaryColor,
                                  ),
                                ),
                                Obx(
                                  () => AutoSizeText.rich(
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
                                          style:
                                              tsBodyMediumSemibold(whiteColor),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AutoSizeText.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                      text: 'Lihat Penjelasan',
                                      style: tsLabelLargeRegular(whiteColor)),
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
                        content: 'Radya Hukma Shabiyyaa Harbani'),
                    SizedBox(height: height * 0.01),
                    UserDataContainer(
                        title: 'Tempat, Tanggal Lahir',
                        content: 'Batam, 17 November 2006'),
                    SizedBox(height: height * 0.01),
                    UserDataContainer(
                        title: 'Alamat',
                        content: 'Griya Batu Aji Ari Blok G1, No 06'),
                    SizedBox(height: height * 0.02),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Logout',
                            style: tsBodyMediumSemibold(whiteColor),
                          ),
                          SvgPicture.asset('assets/icons/logout.svg')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
