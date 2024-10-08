import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/hal_yang_perlu_diperhatikan_controller.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/widgets/bullet_text.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/widgets/button_chip.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class HalYangPerluDiperhatikanView
    extends GetView<HalYangPerluDiperhatikanController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(left: width * 0.05, bottom: height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: blackColor,
                ),
              ),
              Expanded(
                child: FunEducation(
                  width: 25,
                  textStyle: tsBodyLargeSemibold(primaryColor),
                ),
              ),
              SizedBox(width: width * 0.09),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.015,
          ),
          child: Container(
            padding: EdgeInsets.only(
              right: width * 0.05,
              left: width * 0.05,
              top: height * 0.025,
              bottom: height * 0.035,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: width * 0.03),
                      width: width * 0.016,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: warningColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                            text: 'Hal - hal yang perlu diperhatikan orangtua',
                            style: tsBodyMediumSemibold(blackColor)),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.showSchoolInformationModel.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ButtonChip(
                                  text:
                                      '${controller.showSchoolInformationModel[index].title}'),
                              for (var desc in controller
                                  .showSchoolInformationModel[index]
                                  .description)
                                BulletText(text: '${desc.body}'),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: height * 0.035),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: warningColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AutoSizeText(
                    'Setiap hari Kamis, membawa buku gambar dan pewarna. untuk  melatih motorik halus,motorik kasar, konsentrasi, dan kognitif  anak.',
                    maxLines: 5,
                    style: tsBodySmallSemibold(whiteColor),
                  ),
                ),
                SizedBox(height: height * 0.05),
                AutoSizeText.rich(
                  TextSpan(text: 'Dari', style: tsBodySmallRegular(blackColor)),
                ),
                SizedBox(height: height * 0.035),
                AutoSizeText.rich(
                  TextSpan(
                      text: 'Fun Education',
                      style: tsBodySmallSemibold(blackColor)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
