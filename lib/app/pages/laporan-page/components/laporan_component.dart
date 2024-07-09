import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/date_card.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/laporan_container.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tab_item.dart';
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

    return DefaultTabController(
      length: 3,
      child: ListView(
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
          Obx(() {
            if (controller.isLoading.value == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.showCurrentLaporanHarianModel.value
                    .berbuatBaikDenganTeman ==
                null) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: height * 0.15,
                  top: height * 0.15,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/imgTidakAdaLaporan.svg',
                      ),
                      SizedBox(height: height * 0.01),
                      AutoSizeText(
                        'Belum Ada Laporan',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodyMediumSemibold(blackColor),
                      ),
                      AutoSizeText(
                        'Untuk Tanggal Tersebut Belum Ada Laporan',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsLabelLargeRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return LaporanContainer('25', '1');
            }
          }),
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
                  height: height * 0.08,
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
                TextSpan(
                    text: 'Tugas', style: tsBodyMediumSemibold(blackColor)),
              ),
            ],
          ),
          SizedBox(height: 10),

          // TAB BAR //

          TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: primaryColor,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              dividerColor: transparentColor,
              labelColor: primaryColor,
              unselectedLabelColor: greyColor,
              tabs: [
                TabItem(title: 'Terbaru', count: 2),
                TabItem(title: 'Diperiks', count: 3),
                TabItem(title: 'Selesai', count: 5),
              ]),

          SizedBox(height: 20),

          // TAB BAR VIEWS //
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return TugasWidget(
                      color: blueColor,
                      type: 'Dikte & Menulis',
                      title: 'Menulis 5 benda yang sering dilihat oleh ananda',
                    );
                  },
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return TugasWidget(
                      color: primaryColor,
                      type: 'Kreasi',
                      title: 'Mewarnai gambar dengan menggunakan origami',
                    );
                  },
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return TugasWidget(
                      color: greenColor,
                      type: 'Membaca',
                      title: 'Membaca kartu baju sampai cabe',
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
