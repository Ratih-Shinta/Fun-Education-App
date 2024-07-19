import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/widgets/point_report.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class ReportWidget extends StatelessWidget {
  final int no;
  final String text;
  final String point;

  const ReportWidget({
    Key? key,
    required this.no,
    required this.text,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.03),
                  width: width * 0.09,
                  height: height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: whiteColor,
                  ),
                  child: Text(
                    no != 0 ? no.toString() : 'No number provided',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                ),
                Container(
                  width: width * 0.5,
                  child: AutoSizeText.rich(
                    TextSpan(
                        text: text,
                        style: tsBodySmallMedium(blackColor).copyWith(
                          height: 1.25,
                        )),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          PointReport(point: point)
        ],
      ),
    );
  }
}
