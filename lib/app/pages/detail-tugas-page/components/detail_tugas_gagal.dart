import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/widgets/tugas_container.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class DetailTugasGagal extends StatelessWidget {
  const DetailTugasGagal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TugasContainer(
          status: 'Gagal',
          pointContainer: true,
        ),
        SizedBox(height: 40),
        SvgPicture.asset('assets/images/imgGagal.svg'),
        SizedBox(height: 20),
        AutoSizeText.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'Ananda Tidak Mengerjakan Tugas\n',
            style: tsBodyMediumSemibold(blackColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: 'Selalu Periksa Tenggat Waktu',
                style: tsBodySmallRegular(blackColor),
              ),
            ],
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}
