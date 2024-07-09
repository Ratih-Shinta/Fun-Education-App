import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tab_item.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class LaporanComponentFour extends StatelessWidget {
  const LaporanComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
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
        SizedBox(height: 10),
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
    );
  }
}
