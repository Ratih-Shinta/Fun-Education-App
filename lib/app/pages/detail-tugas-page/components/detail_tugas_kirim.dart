import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_detail_image.dart';
import 'package:fun_education_app/app/global-component/common_grid_image.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/detail_tugas_page_controller.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/widgets/multiline_text_field.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DetailTugasKirim extends GetView<DetailTugasPageController> {
  DetailTugasKirim({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/icTaskList.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText.rich(
              textAlign: TextAlign.start,
              TextSpan(
                  text: 'Kirim Tugas', style: tsBodyMediumSemibold(blackColor)),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Obx(() {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.imageFileList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: width * 0.02,
              mainAxisSpacing: height * 0.01,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => CommonDetailImage(
                        imagePath: controller.imageFileList[index].path,
                        isNetwork: false,
                      ));
                },
                child: CommonGridImage(
                  imagePath: controller.imageFileList[index].path,
                  isDelete: true,
                  deleteFunction: () {
                    controller.deleteImage(index);
                  },
                  isNetwork: false,
                ),
              );
            },
          );
        }),
        SizedBox(height: height * 0.015),
        Obx(
          () {
            if (controller.isLoading.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: height * 0.1,
                  width: width,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            } else {
              return CommonButton(
                isLoading: controller.isLoadingStoreTugas.value,
                text: 'Tambah Gambar',
                backgroundColor: greyColor.withOpacity(0.1),
                textColor: blackColor,
                icon: Icons.image,
                onPressed: () {
                  controller.selectImage();
                },
              );
            }
          },
        ),
        SizedBox(height: height * 0.02),
        AutoSizeText.rich(
          TextSpan(
            text: 'Catatan Orang Tua\n',
            style: tsBodyMediumSemibold(blackColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: '*Opsional',
                style: tsBodySmallRegular(blackColor),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: height * 0.01),
        MultilineTextField(
            maxlines: 5,
            hintText: 'Ketik Disini...',
            onChanged: (value) {},
            controller: controller.noteController),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText.rich(
              TextSpan(
                text: 'Tugas Ini Memiliki Bobot :',
                style: tsBodySmallSemibold(blackColor),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: successColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconPoint(
                point: '${Get.arguments?.point.toString() ?? '0'}',
                color: successColor,
                textStyle: tsBodySmallSemibold(whiteColor),
              ),
            )
          ],
        ),
        SizedBox(height: 15),
        CommonButton(
          isLoading: controller.isLoadingStoreTugas.value,
          text: 'Kirim Tugas',
          textColor: whiteColor,
          backgroundColor: blackColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CommonAlertDialog(
                  title: 'Konfirmasi',
                  content:
                      'Apakah anda yakin dengan jawaban tugas yang akan anda kirim?',
                  cancelButtonText: 'Tidak',
                  confirmButtonText: 'Yakin!',
                  onConfirm: () async {
                    await controller.storeKirimTaskUser();
                    if (controller.statusTask!.value == 'null') {
                      Get.until((route) => Get.currentRoute == Routes.NAVBAR);
                    }
                  },
                );
              },
            );
          },
        )
      ],
    );
  }
}
