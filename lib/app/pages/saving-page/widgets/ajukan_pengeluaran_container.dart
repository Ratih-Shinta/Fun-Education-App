import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/saving-page/components/bottomsheet_ajukan_pengeluaran.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class AjukanPengeluaranContainer extends StatelessWidget {
  const AjukanPengeluaranContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.05,
      ),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: 'Ajukan PengeluaranTabungan?\n',
              style: tsBodyMediumSemibold(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Pastikan Saldo Mencukupi',
                  style: tsBodySmallRegular(blackColor),
                ),
              ],
            ),
            maxLines: 2,
          ),
          SizedBox(height: height * 0.03),
          InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  // isScrollControlled: true,
                  builder: (context) => BottomsheetAjukanPengeluaran(),
                );
              },
              child: Row(
                children: [
                  AutoSizeText.rich(TextSpan(
                      text: 'Pilih Pengeluaran',
                      style: tsBodySmallSemibold(blackColor))),
                  Icon(
                    Icons.navigate_next,
                    color: blackColor,
                    size: 18,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
