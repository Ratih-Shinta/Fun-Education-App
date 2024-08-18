import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_detail_image.dart';
import 'package:fun_education_app/app/global-component/common_grid_image.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/detail_tugas_page_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TugasContainer extends GetView<DetailTugasPageController> {
  TugasContainer({super.key});
  // final argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: controller.showByIdTugasModel.value.statusTugasUser ==
                  'Selesai'
              ? greyColor.withOpacity(0.05)
              : controller.showByIdTugasModel.value.statusTugasUser == 'Gagal'
                  ? greyColor.withOpacity(0.05)
                  : controller.showByIdTugasModel.value.category ==
                          'Dikte & Menulis'
                      ? blueColor.withOpacity(0.1)
                      : controller.showByIdTugasModel.value.category == 'Kreasi'
                          ? primaryColor.withOpacity(0.1)
                          : controller.showByIdTugasModel.value.category ==
                                  'Membaca'
                              ? greenColor.withOpacity(0.1)
                              : controller.showByIdTugasModel.value.category ==
                                      'Berhitung'
                                  ? warningColor.withOpacity(0.1)
                                  : dangerColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: controller.showByIdTugasModel.value.category ==
                            'Dikte & Menulis'
                        ? blueColor.withOpacity(0.6)
                        : controller.showByIdTugasModel.value.category ==
                                'Kreasi'
                            ? primaryColor.withOpacity(0.6)
                            : controller.showByIdTugasModel.value.category ==
                                    'Membaca'
                                ? greenColor.withOpacity(0.6)
                                : controller.showByIdTugasModel.value
                                            .category ==
                                        'Berhitung'
                                    ? warningColor.withOpacity(0.6)
                                    : greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: AutoSizeText.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: '${controller.showByIdTugasModel.value.category}',
                      style: tsBodySmallSemibold(whiteColor),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Obx(() {
                  // if (controller.isLoading.value) {
                  //   return Center(child: CircularProgressIndicator());
                  // } else
                  if (controller.showByIdTugasModel.value.statusTugasUser !=
                      null) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: controller
                                    .showByIdTugasModel.value.statusTugasUser ==
                                'Diperiksa'
                            ? warningColor
                            : controller.showByIdTugasModel.value
                                        .statusTugasUser ==
                                    'Selesai'
                                ? successColor
                                : dangerColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: controller
                              .showByIdTugasModel.value.statusTugasUser,
                          style: tsBodySmallSemibold(whiteColor),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(width: 1);
                  }
                })
              ],
            ),
            SizedBox(height: 20),
            AutoSizeText.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: '${controller.showByIdTugasModel.value.title}',
                style: tsBodyMediumSemibold(blackColor),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        text: 'Dibuat pada :',
                        style: tsBodySmallRegular(greyColor),
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        SvgPicture.asset(iconCalender,
                            color: controller.showByIdTugasModel.value
                                        .statusTugasUser ==
                                    'Selesai'
                                ? greyColor.withOpacity(0.5)
                                : controller.showByIdTugasModel.value
                                            .statusTugasUser ==
                                        'Gagal'
                                    ? greyColor.withOpacity(0.5)
                                    : controller.showByIdTugasModel.value
                                                .category ==
                                            'Dikte & Menulis'
                                        ? blueColor
                                        : controller.showByIdTugasModel.value
                                                    .category ==
                                                'Kreasi'
                                            ? primaryColor
                                            : controller.showByIdTugasModel
                                                        .value.category ==
                                                    'Membaca'
                                                ? greenColor
                                                : controller.showByIdTugasModel
                                                            .value.category ==
                                                        'Berhitung'
                                                    ? warningColor
                                                    : dangerColor),
                        SizedBox(width: 5),
                        AutoSizeText.rich(
                          TextSpan(
                            text:
                                '${DateFormat('EEEE, d\nMMMM yyyy', 'id_ID').format(controller.showByIdTugasModel.value.createdAt ?? DateTime.now())}',
                            style: tsBodySmallSemibold(blackColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                            text: 'Tenggat Waktu :',
                            style: tsBodySmallRegular(greyColor),
                          ),
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            SvgPicture.asset(
                              iconCalender,
                              color: controller.showByIdTugasModel.value
                                          .statusTugasUser ==
                                      'Selesai'
                                  ? greyColor.withOpacity(0.5)
                                  : controller.showByIdTugasModel.value
                                              .statusTugasUser ==
                                          'Gagal'
                                      ? greyColor.withOpacity(0.5)
                                      : dangerColor,
                            ),
                            SizedBox(width: 5),
                            AutoSizeText.rich(
                              TextSpan(
                                text:
                                    '${DateFormat('EEEE, d\nMMMM yyyy', 'id_ID').format(controller.showByIdTugasModel.value.deadline ?? DateTime.now())}',
                                style: tsBodySmallSemibold(blackColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.06,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 25),
              height: 1,
              width: double.infinity,
              color: greyColor.withOpacity(0.2),
            ),
            AutoSizeText.rich(
              TextSpan(
                text: 'Deskripsi :\n',
                style: tsBodyMediumSemibold(blackColor),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  controller.showByIdTugasModel.value.images?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: width * 0.02,
                mainAxisSpacing: height * 0.01,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => CommonDetailImage(
                        imagePath: controller
                            .showByIdTugasModel.value.images![index].image
                            .toString(),
                        isNetwork: true,
                      ),
                    );
                  },
                  child: CommonGridImage(
                    imagePath: controller
                        .showByIdTugasModel.value.images![index].image
                        .toString(),
                    isDelete: false,
                    isNetwork: true,
                  ),
                );
              },
            ),
            SizedBox(height: 25),
            AutoSizeText.rich(
              TextSpan(
                text: '${controller.showByIdTugasModel.value.description}',
                style: tsBodySmallMedium(blackColor),
              ),
            ),
            if (controller.showByIdTugasModel.value.statusTugasUser ==
                    'Selesai' ||
                controller.showByIdTugasModel.value.statusTugasUser == 'Gagal')
              Container(
                width: width,
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: controller.showByIdTugasModel.value.statusTugasUser ==
                          'Selesai'
                      ? successColor
                      : dangerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        text: 'Ananda Mendapatkan Poin',
                        style: tsBodySmallRegular(whiteColor),
                      ),
                    ),
                    IconPoint(
                        point:
                            '${controller.showByIdTugasModel.value.point.toString()}',
                        color: controller
                                    .showByIdTugasModel.value.statusTugasUser ==
                                'Selesai'
                            ? successColor
                            : dangerColor),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}
