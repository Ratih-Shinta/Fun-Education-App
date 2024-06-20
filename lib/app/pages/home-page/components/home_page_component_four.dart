import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HomePageComponentFour extends StatelessWidget {
  const HomePageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

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
        SizedBox(height: height * 0.02),
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
        TugasWidget(
          color: warningColor,
          type: 'Berhitung',
          title: 'Perhatikan soal berikut',
        ),
      ],
    );

    
  }
}
