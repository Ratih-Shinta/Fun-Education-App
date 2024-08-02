import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_detail_image.dart';
import 'package:fun_education_app/app/global-component/common_grid_image.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/detail_tugas_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailTugasSelesai extends GetView<DetailTugasPageController> {
  const DetailTugasSelesai({super.key});

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
              TextSpan(text: 'Tugas', style: tsBodyMediumSemibold(blackColor)),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.showCurrentTugasUserModel.value.images?.length ?? 0,
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
                      imagePath: controller.showCurrentTugasUserModel.value.images![index].image.toString(),
                      isNetwork: true,
                    ),
                  );
                },
                child: CommonGridImage(
                  imagePath: controller.showCurrentTugasUserModel.value.images![index].image.toString(),
                  isDelete: false,
                  isNetwork: true,
                ),
              );
            },
          ),
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
        Container(
          width: width,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: opacity5GreyColor),
          child: AutoSizeText.rich(
            TextSpan(
              text: '${controller.showCurrentTugasUserModel.value.note}',
              style: tsBodySmallSemibold(blackColor),
            ),
          ),
        ),
      ],
    );
  }
}
