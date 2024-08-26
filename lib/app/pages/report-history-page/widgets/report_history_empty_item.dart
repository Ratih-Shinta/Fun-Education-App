// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/report-history-page/report_history_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ReportHistoryEmptyItem extends GetView<ReportHistoryPageController> {
  final DateTime selectedDate;
  const ReportHistoryEmptyItem({
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              SvgPicture.asset('assets/images/imgReportEmpty.svg'),
              SizedBox(height: height * 0.02),
              AutoSizeText(
                'Tidak Ada Laporan',
                group: AutoSizeGroup(),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: tsBodyMediumSemibold(blackColor),
              ),
              SizedBox(height: height * 0.005),
              AutoSizeText(
                'Tidak ada Laporan di tanggal\n${DateFormat('dd MMMM yyyy').format(selectedDate)}',
                group: AutoSizeGroup(),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: tsBodySmallRegular(blackColor),
              )
            ],
          ),
        ),
        SizedBox(height: height * 0.05),
      ],
    );
  }
}
