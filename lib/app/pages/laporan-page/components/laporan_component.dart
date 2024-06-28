import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/date_card.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/laporan_container.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/status_button.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LaporanComponent extends GetView<LaporanPageController> {
  const LaporanComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    List<DateTime> dates = controller.generateDates();

    return Column(
      children: [
        Container(
          height: 75,
          child: ListView.builder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              DateTime date = dates[index];
              return DateCard(date: date);
            },
          ),
        ),
        LaporanContainer('25', '1'),
        Row(
          children: [
            SvgPicture.asset('assets/icons/icTaskList.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText.rich(
              TextSpan(
                  text: 'Alur Belajar Ananda',
                  style: tsBodyMediumSemibold(blackColor)),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 30),
          padding: EdgeInsets.only(right: 21, left: 10, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 5,
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: successColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                          text: 'Mengenalkan Buku A',
                          style: tsBodyMediumSemibold(whiteColor)),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText.rich(TextSpan(
                          text: "•",
                          style: tsBodySmallRegular(whiteColor),
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: AutoSizeText.rich(
                            TextSpan(
                              text: 'Menebalkan Huruf',
                              style: tsBodySmallRegular(whiteColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText.rich(TextSpan(
                          text: "•",
                          style: tsBodySmallRegular(whiteColor),
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: AutoSizeText.rich(
                            TextSpan(
                              text: 'Membaca Kartu Baju Sampai Cabe',
                              style: tsBodySmallRegular(whiteColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
        ),
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
        SizedBox(height: 10),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusButton('Terbaru', 0, 12),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  height: 13,
                  width: 1,
                  color: opacity50GreyColor,
                ),
                StatusButton('Diperiksa', 1, 3),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  height: 13,
                  width: 1,
                  color: opacity50GreyColor,
                ),
                StatusButton('Selesai', 2, 10),
              ],
            ),
            SizedBox(height: 20),
            Obx(() => IndexedStack(
                  index: controller.selectedStatus.value,
                  children: [
                    TugasWidget(
                      color: blueColor,
                      type: 'Dikte & Menulis',
                      title: 'Menulis 5 benda yang sering dilihat oleh ananda',
                    ),
                    TugasWidget(
                      color: primaryColor,
                      type: 'Kreasi',
                      title: 'Mewarnai gambar dengan menggunakan origami',
                    ),
                    TugasWidget(
                      color: greenColor,
                      type: 'Membaca',
                      title: 'Membaca kartu baju sampai cabe',
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}
