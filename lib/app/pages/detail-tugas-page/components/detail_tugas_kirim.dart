import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_detail_image.dart';
import 'package:fun_education_app/app/global-component/common_grid_image.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/detail_tugas_page_controller.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/widgets/multiline_text_field.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailTugasKirim extends GetView<DetailTugasPageController> {
  DetailTugasKirim({super.key});
  final argument = Get.arguments;

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
        CommonButton(
          text: 'Tambah Gambar',
          color: opacity10GreyColor,
          textColor: blackColor,
          icon: Icons.image,
          onPressed: () {
            controller.selectImage();
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
                text: '*opsional',
                style: tsBodySmallRegular(dangerColor),
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: successColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconPoint(
                point: '${argument?.point?.toString() ?? '0'}',
                color: successColor,
                textStyle: tsBodySmallSemibold(whiteColor),
              ),
            )
          ],
        ),
        SizedBox(height: 15),
        CommonButton(
          text: 'Kirim Tugas',
          color: blackColor,
          onPressed: () {
            controller.storeKirimTaskUser();
          },
        )
      ],
    );
  }
}
