import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/detail_tugas_page_controller.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/widgets/tugas_container.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailTugasKirim extends GetView<DetailTugasPageController> {
  final laporanController = Get.put(LaporanPageController());
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
        TugasContainer(
          pointContainer: false,
        ),
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
        Container(
          margin: EdgeInsets.only(bottom: 15),
          height: height * 0.092,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Container(
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 25,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Icon(
                          Icons.close,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        CommonButton(
          text: 'Tambah Gambar',
          color: opacity10GreyColor,
          textColor: blackColor,
          icon: Icons.image,
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
          height: 150,
          width: width,
          margin: EdgeInsets.only(top: 10, bottom: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: opacity5GreyColor),
          child: AutoSizeText.rich(
            TextSpan(
              text: 'Ketik Disini...',
              style: tsBodySmallRegular(opacity50GreyColor),
            ),
          ),
        ),
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
                point: '${argument.point.toString()}',
                color: successColor,
                textStyle: tsBodySmallSemibold(whiteColor),
              ),
            )
          ],
        ),
        SizedBox(height: 15),
        CommonButton(text: 'Kirim Tugas', color: blackColor)
      ],
    );
  }
}
