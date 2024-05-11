import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HomePageComponentFive extends StatelessWidget {
  const HomePageComponentFive({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.035, vertical: height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: opacity5SecondaryColor),
      child: Column(
        children: [
          ReportWidget(
              no: 1,
              text: 'Datang tepat pada waktunya',
              point: 'A',
              pointColor: greenColor),
          ReportWidget(
              no: 2,
              text: 'Berpakaian rapi',
              point: 'B',
              pointColor: blueColor),
          ReportWidget(
              no: 3,
              text: 'Berbuat baik dengan teman',
              point: 'B',
              pointColor: blueColor),
          ReportWidget(
              no: 4,
              text: 'Mau menolong dan berbagi dengan teman',
              point: 'B',
              pointColor: blueColor),
          ReportWidget(
              no: 5,
              text: 'Merapikan alat belajar dan mainan sendiri',
              point: 'B',
              pointColor: blueColor),
          ReportWidget(
              no: 6,
              text: 'Menyelesaikan tugas',
              point: 'B',
              pointColor: blueColor),
          ReportWidget(
              no: 7, text: 'Membaca', point: 'B', pointColor: blueColor),
          ReportWidget(
              no: 8, text: 'Menulis', point: 'B', pointColor: blueColor),
          ReportWidget(
              no: 9, text: 'Dikte', point: 'B', pointColor: blueColor),
          ReportWidget(
              no: 10,
              text: 'Keterampilan',
              point: 'C',
              pointColor: warningColor),
        ],
      ),
    );
  }
}
